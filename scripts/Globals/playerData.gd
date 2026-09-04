extends Node

var player_data = {}

const PLAYER_DIR := "user://"
const FOLDERS := [
	"desktops",
	"data",
	"mods",
	"apps"
]


func _ready() -> void:
	load_player_dir()


func load_player_dir() -> void:
	# Make sure all required folders exist
	for folder in FOLDERS:
		var path = PLAYER_DIR + folder
		
		if not DirAccess.dir_exists_absolute(path):
			DirAccess.make_dir_absolute(path)
			print("Created directory: " + path)

	# Now inspect the player directory
	var dir = DirAccess.open(PLAYER_DIR)

	if dir == null:
		print("Failed to open player directory.")
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
	var path = PLAYER_DIR + FOLDERS[0] + "/" + random_file

	var image = Image.new()
	image.load(path)

	if image == null:
		print("Failed to load desktop image: ", path)
		return load("res://assets/" + desktops[randi_range(0,1)])

	return ImageTexture.create_from_image(image)
