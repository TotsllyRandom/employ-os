extends Node

signal settings_changed

var show_seconds: bool = true:
	set(new):
		show_seconds = new
		settings_changed.emit()
	
var top_bar_size: int = 40:
	set(new):
		top_bar_size = new
		settings_changed.emit()
	

@onready var screen_size = get_viewport().size / 2
