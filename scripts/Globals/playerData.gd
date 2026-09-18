extends Node

## Default Player Data
var default_player_data = {
	"name" : "John Doe",
	"money" : 100,
	"job" : "quickloans",
	"exp" : 0,
}

var default_job_specific_data = {
	"quickloans" : {
		"exp":0,
		"total loans completed":0,
		"total loans accepted":0,
		"total loans correct":0,
		"upgrades" : {
			
		}
		}
}

## Real Player Data
var player_data = {}
var job_specific_data = {}


const PLAYER_DIR := "user://"
const FOLDERS := [
	"desktops",
	"data",
	"mods",
	"apps"
]
const PATH_FOLDER = PLAYER_DIR + FOLDERS[1]
const PATH = PATH_FOLDER + "/player.json"


func _ready() -> void:
	load_player_dir()
	load_player_data()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print("SAVING PLAYER DATA: ", player_data)
		save_player_data()
		get_tree().quit()


func load_player_dir() -> void:
	# Make sure all required folders exist
	for folder in FOLDERS:
		var p = PLAYER_DIR + folder
		
		if not DirAccess.dir_exists_absolute(p):
			DirAccess.make_dir_absolute(p)
	
	var dir = DirAccess.open(PLAYER_DIR)
	
	if dir == null:
		return
		
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	
	while file_name != "":
		if dir.current_is_dir():
			print("Found directory: " + file_name)
		else:
			print("Found file: " + file_name)
			
		file_name = dir.get_next()
	print(OS.get_user_data_dir())
	
	dir.list_dir_end()

func save_job_upgrades(entry: Dictionary):
	job_specific_data[player_data["job"]]["upgrades"] = entry

func save_player_data():
	var file = FileAccess.open(PATH, FileAccess.WRITE)
	if file:
		print("found Player Data file")
	file.store_string(JSON.stringify(player_data))
	print("Stored Data: "+JSON.stringify(player_data))
	file.close()
	
	file = FileAccess.open(PATH_FOLDER+"/"+player_data["job"]+".json", FileAccess.WRITE)
	if file:
		print("found Job Data file")
	file.store_string(JSON.stringify(job_specific_data))
	print("Stored Data: "+JSON.stringify(job_specific_data))
	file.close()

func load_player_data():
	#Player Data
	if not FileAccess.file_exists(PATH):
		var newFile = FileAccess.open(PATH, FileAccess.WRITE)
		newFile.store_string(JSON.stringify(default_player_data))
		newFile.close()
	player_data = JSON.parse_string(FileAccess.get_file_as_string(PATH))
	if player_data == null:
		player_data = default_player_data
	for key in default_player_data:
		if not player_data.keys().has(key):
			player_data[key] = default_player_data[key]
	
	#Job Data
	if not FileAccess.file_exists(PATH_FOLDER+"/"+player_data["job"]+".json"):
		var newFile = FileAccess.open(PATH_FOLDER+"/"+player_data["job"]+".json", FileAccess.WRITE)
		newFile.store_string(JSON.stringify(default_job_specific_data[player_data["job"]]))
		newFile.close()
	job_specific_data = JSON.parse_string(FileAccess.get_file_as_string(PATH_FOLDER+"/"+player_data["job"]+".json"))
	if job_specific_data == null:
		job_specific_data = default_job_specific_data[player_data["job"]]
	for key in default_job_specific_data[player_data["job"]]:
		if not job_specific_data.keys().has(key):
			job_specific_data[key] = default_job_specific_data[player_data["job"]][key]
	
	print(job_specific_data)
	
func get_desktop():
	var dir = DirAccess.open(PLAYER_DIR + FOLDERS[0])
	dir.list_dir_begin()
	
	var file_name = dir.get_next()
	var files = []
	
	
	while file_name != "":
		if dir.current_is_dir():
			print("Found directory: " + file_name)
		else:
			print("Found file: " + file_name)
			files.append(file_name)
		
		
		
		file_name = dir.get_next()
	
	dir.list_dir_end()
	
	var desktops = [
		"desptop.jpg",
		"desktop.png"
	]
	
	if files.is_empty() or not Settings.use_custom_desktop:
		return load("res://assets/" + desktops[randi_range(0,1)])
	
	var random_file = files[randi_range(0, files.size() - 1)]
	var ImgPath = PLAYER_DIR + FOLDERS[0] + "/" + random_file
	
	var image = Image.new()
	image.load(ImgPath)
	
	if image == null:
		print("Failed to load desktop image: ", ImgPath)
		return load("res://assets/" + desktops[randi_range(0,1)])
		
	return ImageTexture.create_from_image(image)
