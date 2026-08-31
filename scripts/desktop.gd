extends Control

var window_script = load("res://scripts/window.gd")
var job = "quickloans"

## children
@onready var top_bar = $topBar
@onready var desktop_image = $desktopImage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	check_settings()
	Settings.settings_changed.connect(check_settings)

func check_settings():
	if Settings.top_bar_size != top_bar.size.y:
		top_bar.size.y = Settings.top_bar_size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Make Window Debug"):
		make_window("incorrectJob")
	$topBar/time.text = GameTime.get_clock_time()
	
func make_window(app:String):
	var win = Window.new()
	win.name = app
	for child in get_children():
		if child.is_in_group("window"):
			if child.name == app:
				win.name = "DELETE"
	win.add_to_group("window")
	win.set_script(window_script)
	win.close_requested.connect(win.close)
	win.position = Vector2i(
		50,50
	)
	
	add_child(win)
	
	
