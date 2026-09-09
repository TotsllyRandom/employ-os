extends Control

## for use when adding more jobs
var apps = {
	"quickloans":{
		"min_size" = Vector2i(400,220),
		"req_job" = "quickloans",
		"name" = "Quickloans",
	},
	"settings":{
		"min_size" = Vector2i(200,300),
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
