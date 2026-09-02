extends Control

func clear():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Customers.customer == {}:
		$Usable.visible = false
		return
	$Usable.visible = true
	$Usable/VBoxContainer/Name.text = Customers.customer.get("name")
	$Usable/VBoxContainer/Job.text = Customers.customer.get("job")
	$Usable/VBoxContainer/Age.text = str(Customers.customer.get("age"))
	$Usable/VBoxContainer/Education.text = Customers.customer.get("education")
	$Usable/VBoxContainer/Status.text = Customers.customer.get("status")
	$Usable/VBoxContainer/Credit.text = str(Customers.customer.get("credit score"))
