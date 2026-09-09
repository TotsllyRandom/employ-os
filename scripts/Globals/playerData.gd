extends Node

## Default Player Data
var default_player_data = {
	"name" = "John Doe",
	"money" = 100,
	"job" = "quickloans",
	"exp" = 0,
}

## Real Player Data
var player_data = {}


const PLAYER_DIR := "user://"
const FOLDERS := [
	"desktops",
	"data",
	"mods",
	"apps"
]

const PATH = PLAYER_DIR + FOLDERS[1] + "/player.json"

func _ready() -> void:
	load_player_dir()
	load_player_data()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
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

func save_player_data():
	var file = FileAccess.open(PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(player_data))
	file.close()

func load_player_data():
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
	print(player_data)
	
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
