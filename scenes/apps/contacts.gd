extends Control

func check_for_cust(text:String):
	var corrected = text.to_lower()
	var found = get_array_of_names(corrected)
	$Usable/CustomerSearch/VBoxContainer/Name.visible = true
	for item in found:
		var new = $Usable/CustomerSearch/VBoxContainer/Name.duplicate()
		new.name = item
		new.text = new.name
		$Usable/CustomerSearch/VBoxContainer.add_child(new)
	$Usable/CustomerSearch/VBoxContainer/Name.visible = false
	if len(found) == 0:
		$Usable/Label.visible = true
	else:
		$Usable/Label.visible = false
		
	
func chose_a_cust(name):
	var n = name.to_lower()
	var keys = []
	for key in Customers.customers.keys():
		keys.append(key.to_lower())
	
	Customers.get_customer(keys.find(n))
	

func get_array_of_names(entry:String) -> Array:
	var ret = []
	
	for key in Customers.customers.keys():
		var k = key.to_lower()
		if k == entry or k.contains(entry):
			ret.append(key)
	
	return ret

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Customers.customer == {}:
		$Usable/InCustomerMenu.visible = false
		return

	$Usable/InCustomerMenu/VBoxContainer.visible = true


	$Usable/InCustomerMenu/VBoxContainer/Name.text = Customers.customer.get("name")
	$Usable/InCustomerMenu/VBoxContainer/Job.text = "Job: " + Customers.customer.get("job")
	$Usable/InCustomerMenu/VBoxContainer/Age.text = "Age: " + str(Customers.customer.get("age"))
	$Usable/InCustomerMenu/VBoxContainer/Credit.text = "Credit Score: " + str(Customers.customer.get("credit score"))
	$Usable/InCustomerMenu/VBoxContainer/Employment.text = "Employed for " + str(Customers.customer.get("employment years")) + " years"

func _on_line_edit_text_submitted(new_text: String) -> void:
	Customers.delete_customer()
	print("customer checked: "+ new_text)
	print(Customers.customers.has(new_text))
	check_for_cust(new_text)
