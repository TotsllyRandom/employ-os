extends Window

func _ready():
	var scene = load("res://scenes/apps/" + title + ".tscn")
	if scene:
		add_child(scene.instantiate())
		
func close():
	queue_free()
