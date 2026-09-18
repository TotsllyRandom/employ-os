extends Control

var window_script = load("res://scripts/window.gd")
var job = "quickloans"

## children
@onready var top_bar = $topBar
@onready var desktop_image = $desktopImage

## delta check (checks every 5 mins for saving)
@export var dCheck := 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	check_settings(["desktop"])
	Settings.settings_changed.connect(check_settings)

func check_settings(status:Array):
	if Settings.top_bar_size != top_bar.size.y:
		top_bar.size.y = Settings.top_bar_size
	if status.has("desktop"):
		$desktopImage.texture = PlayerData.get_desktop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Make Window Debug"):
		Applications.make_window(Applications.get_random())
	$topBar/time.text = GameTime.get_clock_time()
	$topBar/money.text = "$"+Extras.comma(PlayerData.player_data["money"])
	dCheck -= _delta
	$topBar/deltaCheck.visible = false
	if dCheck<= 0.0:
		PlayerData.save_player_data()
		dCheck = 300.0
	if dCheck<= 5.0:
		$topBar/deltaCheck.visible = true
		$topBar/deltaCheck.text = "  Autosave in "+str(round(int(dCheck)))
	
	
	
