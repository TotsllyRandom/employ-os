extends Control

var guide = {
	"min_age" = 0,
	"max_age" = 106,
}
## All Rules
const RULES = [
	{
		"text" : "Applicant must be 18 or older.",
		"diff" : 1,
	},
	{
		"text" : "Applicant must under 90 years old.",
		"diff" : 1,
	},
]

func interpret_rules(text: String):
	match text:
		"Applicant must be 18 or older.":
			guide["min_age"] = 18
			return
		"Applicant must under 90 years old.":
			guide["max_age"] = 90
			return
		

## ruleset made when player starts shift
var rules = []


@export var screen: String = "Home":
	set(new):
		$"Main/Usable Area/Home".visible = (new == "Home")
		$"Main/Usable Area/Customer".visible = (new == "Customer")
		$"Main/Usable Area/Employee".visible = (new == "Employee")
		screen = new
		update_screens()

@export var is_in_shift: bool = false:
	set(new):
		if new:
			make_rules(3)
			create_new_customer()
		else:
			rules = []
			delete_customer(false)
		is_in_shift = new
		update_screens()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen = "Home"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$"Main/Usable Area".size.y = $Main.size.y - $"Button Panel".size.y
	$"Main/Usable Area".position.y = $"Button Panel".size.y



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

func update_screens():
	if screen == "Customer":
		if is_in_shift:
			$"Main/Usable Area/Customer/Name".visible = true
			$"Main/Usable Area/Customer/Name".text = Customers.customer.get("name")
			var items = ["Approve","Deny"]
			$"Main/Usable Area/Customer/Loan Amount".visible = true
			$"Main/Usable Area/Customer/Loan Amount".text = items[randi() % 2]
			$"Main/Usable Area/Customer/Panel".visible = true
			$"Main/Usable Area/Customer/Warn".visible = false
		else:
			$"Main/Usable Area/Customer/Name".visible = false
			$"Main/Usable Area/Customer/Warn".visible = true
			$"Main/Usable Area/Customer/Loan Amount".visible = false
			$"Main/Usable Area/Customer/Panel".visible = false
			
	if screen == "Home":
		$"Main/Usable Area/Home/OutShift".visible = false
		$"Main/Usable Area/Home/InShift".visible = false
		if is_in_shift:
			$"Main/Usable Area/Home/InShift".visible = true
			$"Main/Usable Area/Home/InShift/Rules".text = get_rule_text()
			
		else:
			$"Main/Usable Area/Home/OutShift".visible = true

func _on_employee_pressed() -> void:
	screen = "Employee"

func loan_complete(result: String) -> void:
	var ret = "Approve"
	if Customers.customer["age"] != clamp(Customers.customer["age"], guide["min_age"], guide["max_age"]):
		ret = "Deny"
	if result == ret:
		PlayerData.player_data["money"] += 50
	delete_customer(true)

func loan_approved() -> void:
	loan_complete("Approve")

func loan_denied() -> void:
	loan_complete("Deny")

func make_rules(diff:int):
	diff = clamp(diff, 1, 5)
	diff = 3
	
	rules = []
	
	for i in range(diff):
		var new_rule = -1
		while (new_rule<0||rules.has(new_rule))&& not len(rules) == len(RULES):
			new_rule = randi_range(0,len(RULES)-1)
		if new_rule >= 0:
			rules.append(new_rule)
	print(rules)
	for rule in rules:
		interpret_rules(RULES[rule]["text"])
	print(guide)
		

func get_rule_text():
	var ret := "\n"
	var i = 1
	for rule in rules:
		ret += str(i)+") "+(RULES[rule]["text"]) + "\n"
		i += 1
	
	return ret

func _on_start_shift_pressed() -> void:
	is_in_shift = true


func _on_end_shift_pressed() -> void:
	is_in_shift = false
