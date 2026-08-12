extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fix_body()

func fix_body():
	$"Top Bar".size.y = 30
	$"BG".size.y = size.y - 30
	$"BG".position.y = 30
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
