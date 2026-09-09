extends Window

@onready var system_theme = load("res://assets/other/SystemTheme.tres")

func _ready():
	if name == "DELETE":
		queue_free()
		return
	var n = name
	if Applicatons.apps[name].get("req_job") != null && Applicatons.apps[name].get("req_job") != PlayerData.player_data["job"]:
		n = "incorrectJob"
	title = Applicatons.apps[n].get("name")
	
	var scene = load("res://scenes/apps/" + n + ".tscn")
	if scene:
		add_child(scene.instantiate())
	if Applicatons.apps[n].get("min_size"):
		min_size = Applicatons.apps[n].get("min_size")
	if Applicatons.apps[n].get("max_size"):
		max_size = Applicatons.apps[n].get("max_size")
		
func close():
	queue_free()

func _process(_delta: float) -> void:
	position.y = clamp(position.y,Settings.top_bar_size + 30, get_parent().size.y - size.y)
	position.x = clamp(position.x,0, get_parent().size.x - size.x)
	
