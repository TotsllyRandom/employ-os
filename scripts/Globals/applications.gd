extends Control

## for use when adding more jobs
var apps = {
	"quickloans":{
		"min_size" = Vector2i(400,220),
		"req_job" = "quickloans",
		"name" = "Quickloans",
	},
	"settings":{
		"min_size" = Vector2i(300,300),
		"name" = "Settings",
	},
	"contacts":{
		"min_size" = Vector2i(400,220),
		"name" = "Contacts",
	},
	"incorrectJob":{
		"min_size" = Vector2i(270,160),
		"max_size" = Vector2i(280,170),
		"name" = "Requirements Not Met",
	},
}

"""
"name" - window's name
"min-size" - minimum size of window
"max-size" - maximum size of window
"req_job" - required job, if any
"""

func get_random():
	return apps.keys()[randi_range(0,len(apps.keys())-1)]

func make_window(app:String):
	var win = Window.new()
	win.name = app
	win.add_to_group("window")
	win.set_script(load("res://scripts/window.gd"))
	win.app = app
	for child in get_tree().root.get_node_or_null("desktop").get_children():
		if child.is_in_group("window"):
			if child.name == app:
				win.app = "DELETE"
	win.close_requested.connect(win.close)
	win.position = Vector2i(
		50,50
	)
	
	get_tree().root.get_node_or_null("desktop").add_child(win)
