extends Control

## The identity of the current app
@export var APP_NAME: String = "":
	set(new):
		
		if APP_NAME == "":
			return
		APP_NAME = new


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass
