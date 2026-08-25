extends Control

var window_script = load("res://scripts/window.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Make Window Debug"):
		make_window("quickloans")
	
func make_window(app:String):
	var win = Window.new()
	win.title = app
	win.set_script(window_script)
	win.close_requested.connect(win.close)
	win.position = Vector2i(
		50,50
	)
	add_child(win)
	
	
