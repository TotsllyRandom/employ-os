extends Control

func clear():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func check_for_cust(text:String):
	var corrected = text.to_lower()
	var keys = []
	for key in Customers.customers.keys():
		keys.append(str(key).to_lower())
	if keys.has(corrected):
		$Usable/Label.visible = false
		Customers.get_customer(keys.find(corrected))
	else:
		$Usable/Label.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Customers.customer == {}:
		$Usable/VBoxContainer.visible = false
		return

	$Usable/VBoxContainer.visible = true


	$Usable/VBoxContainer/Name.text = Customers.customer.get("name")
	$Usable/VBoxContainer/Job.text = "Job: " + Customers.customer.get("job")
	$Usable/VBoxContainer/Age.text = "Age: " + str(Customers.customer.get("age"))
	$Usable/VBoxContainer/Credit.text = "Credit Score: " + str(Customers.customer.get("credit score"))
	$Usable/VBoxContainer/Employment.text = "Employment: " + str(Customers.customer.get("employment years")) + " years"

func _on_line_edit_text_submitted(new_text: String) -> void:
	Customers.delete_customer()
	print("customer checked: "+ new_text)
	print(Customers.customers.has(new_text))
	check_for_cust(new_text)
