extends Window

@onready var system_theme = load("res://assets/other/SystemTheme.tres")

func _ready():
	if name == "DELETE":
		queue_free()
		return
	title = Applicatons.apps[name].get("name")
	
	var scene = load("res://scenes/apps/" + name + ".tscn")
	if scene:
		add_child(scene.instantiate())
		
func close():
	queue_free()

func _process(_delta: float) -> void:
	position.y = clamp(position.y,Settings.top_bar_size + 30, get_parent().size.y - size.y)
	position.x = clamp(position.x,0, get_parent().size.x - size.x)
	
	if Applicatons.apps[name].get("min_size"):
		size.x = max(size.x, Applicatons.apps[name].get("min_size").x)
		size.y = max(size.y, Applicatons.apps[name].get("min_size").y)
	if Applicatons.apps[name].get("max_size"):
		size.x = min(size.x, Applicatons.apps[name].get("max_size").x)
		size.y = min(size.y, Applicatons.apps[name].get("max_size").y)
