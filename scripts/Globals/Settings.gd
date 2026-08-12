extends Node

signal settings_changed

var show_seconds: bool = false:
	set(new):
		show_seconds = new
		settings_changed.emit()
