# THIS IS THE APP SCRIPT, NOT THE GLOBAL SCRIPT
extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Main/VBoxContainer/Show_seconds/CheckButton.button_pressed = Settings.show_seconds
	$"Main/VBoxContainer/Show AMPM/CheckButton".button_pressed = Settings.show_AmPm
	$"Main/VBoxContainer/UseCustomDesktop/CheckButton".button_pressed = Settings.use_custom_desktop
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Main/VBoxContainer.size = Vector2i($Main.size.x - 20,$Main.size.y - 20 )
	$Main/VBoxContainer.position = Vector2i(10,10)


func open_user_folder() -> void:
	var path = ProjectSettings.globalize_path("user://")
	OS.shell_open("file://" + path)


func Change_show_seconds() -> void:
	Settings.show_seconds = $Main/VBoxContainer/Show_seconds/CheckButton.button_pressed
