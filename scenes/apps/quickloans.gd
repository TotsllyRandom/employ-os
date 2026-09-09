extends Control

@export var screen: String = "Home":
	set(new):
		$"Main/Usable Area/Home".visible = new == "Home"
		$"Main/Usable Area/Customer".visible = new == "Customer"
		$"Main/Usable Area/Employee".visible = new == "Employee"
		screen = new

@export var is_in_shift: bool = true:
	set(new):
		if new:
			create_new_customer()
		else:
			delete_customer(false)
		is_in_shift = new

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen = "Home"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"Main/Usable Area".size.y = $Main.size.y - $"Button Panel".size.y



## Make data for new customer
func create_new_customer():
	if Customers.customer == {}:
		Customers.make_customer("quickloans")
	update_screens()

## delete data for old customer
func delete_customer(make_new: bool):
	Customers.delete_customer()
	if make_new:
		create_new_customer()


func _on_home_pressed() -> void:
	screen = "Home"


func _on_customer_pressed() -> void:
	screen = "Customer"
	create_new_customer()

func update_screens():
	if screen == "Customer":
		$"Main/Usable Area/Customer/Name".text = Customers.customer.get("name")
		var items = ["Approve","Deny"]
		$"Main/Usable Area/Customer/Loan Amount".text = items[randi() % 2]

func _on_employee_pressed() -> void:
	screen = "Employee"

func loan_complete(result: String) -> void:
	if $"Main/Usable Area/Customer/Loan Amount".text == result:
		PlayerData.player_data["money"] += 50
	delete_customer(true)

func loan_approved() -> void:
	loan_complete("Approve")


func loan_denied() -> void:
	loan_complete("Deny")
