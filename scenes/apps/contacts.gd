extends Control

func clear():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Customers.customer == {}:
		$Usable.visible = false
		return

	$Usable.visible = true

	$Usable/VBoxContainer/Name.text = Customers.customer.get("name")
	$Usable/VBoxContainer/Job.text = "Job: " + Customers.customer.get("job")
	$Usable/VBoxContainer/Age.text = "Age: " + str(Customers.customer.get("age"))
	$Usable/VBoxContainer/Credit.text = "Credit Score: " + str(Customers.customer.get("credit score"))
	$Usable/VBoxContainer/Income.text = "Income: $" + str(Customers.customer.get("income"))
	$Usable/VBoxContainer/Debt.text = "Debt: $" + str(Customers.customer.get("debt"))
	$Usable/VBoxContainer/Employment.text = "Employment: " + str(Customers.customer.get("employment years")) + " years"
	$Usable/VBoxContainer/Loan.text = "Loan Amount: $" + str(Customers.customer.get("loan amount"))
	$Usable/VBoxContainer/DTI.text = "Debt-to-Income: " + str(Customers.customer.get("dti")) + "%"
	$Usable/VBoxContainer/PaymentHistory.text = "Payment History: " + Customers.customer.get("payment history")
