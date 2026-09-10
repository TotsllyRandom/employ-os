extends Control

var guide = {
	"min_age": 0,
	"max_age": 106,
	"min_credit_score": 300,
	"max_credit_score": 850,
	"min_income": 0,
	"max_income": 150000,
	"max_debt": 100000,
	"min_employment": 0,
	"max_loan": 100000,
	"min_loan": 0,
	"max_dti": 100,
	"payment_history": [],
}
## All Rules
const RULES = [
	{"text" : "Applicant must be 18 or older.", "diff" : 1, "type" : "min_age"},
	{"text" : "Applicant must be 21 or older.", "diff" : 1, "type" : "min_age"},
	{"text" : "Applicant must be 25 or older.", "diff" : 2, "type" : "min_age"},
	{"text" : "Applicant must be 30 or older.", "diff" : 2, "type" : "min_age"},
	{"text" : "Applicant must be 40 or older.", "diff" : 2, "type" : "min_age"},
	{"text" : "Applicant must be 50 or older.", "diff" : 3, "type" : "min_age"},

	{"text" : "Applicant must be under 90 years old.", "diff" : 1, "type" : "max_age"},
	{"text" : "Applicant must be under 80 years old.", "diff" : 1, "type" : "max_age"},
	{"text" : "Applicant must be under 70 years old.", "diff" : 2, "type" : "max_age"},
	{"text" : "Applicant must be under 65 years old.", "diff" : 2, "type" : "max_age"},
	{"text" : "Applicant must be under 60 years old.", "diff" : 3, "type" : "max_age"},
	{"text" : "Applicant must be under 50 years old.", "diff" : 3, "type" : "max_age"},

	{"text" : "Applicant must have a credit score of 500 or higher.", "diff" : 1, "type" : "min_credit"},
	{"text" : "Applicant must have a credit score of 550 or higher.", "diff" : 1, "type" : "min_credit"},
	{"text" : "Applicant must have a credit score of 600 or higher.", "diff" : 1, "type" : "min_credit"},
	{"text" : "Applicant must have a credit score of 620 or higher.", "diff" : 1, "type" : "min_credit"},
	{"text" : "Applicant must have a credit score of 650 or higher.", "diff" : 2, "type" : "min_credit"},
	{"text" : "Applicant must have a credit score of 680 or higher.", "diff" : 2, "type" : "min_credit"},
	{"text" : "Applicant must have a credit score of 700 or higher.", "diff" : 2, "type" : "min_credit"},
	{"text" : "Applicant must have a credit score of 720 or higher.", "diff" : 3, "type" : "min_credit"},
	{"text" : "Applicant must have a credit score of 750 or higher.", "diff" : 3, "type" : "min_credit"},

	{"text" : "Applicant must have a credit score under 850.", "diff" : 1, "type" : "max_credit"},
	{"text" : "Applicant must have a credit score under 800.", "diff" : 2, "type" : "max_credit"},
	{"text" : "Applicant must have a credit score under 750.", "diff" : 2, "type" : "max_credit"},
	{"text" : "Applicant must have a credit score under 700.", "diff" : 3, "type" : "max_credit"},

	{"text" : "Applicant must earn at least $25,000 per year.", "diff" : 1, "type" : "min_income"},
	{"text" : "Applicant must earn at least $35,000 per year.", "diff" : 1, "type" : "min_income"},
	{"text" : "Applicant must earn at least $50,000 per year.", "diff" : 2, "type" : "min_income"},
	{"text" : "Applicant must earn at least $65,000 per year.", "diff" : 2, "type" : "min_income"},
	{"text" : "Applicant must earn at least $80,000 per year.", "diff" : 3, "type" : "min_income"},
	{"text" : "Applicant must earn at least $100,000 per year.", "diff" : 3, "type" : "min_income"},

	{"text" : "Applicant must earn less than $150,000 per year.", "diff" : 1, "type" : "max_income"},
	{"text" : "Applicant must earn less than $100,000 per year.", "diff" : 2, "type" : "max_income"},
	{"text" : "Applicant must earn less than $75,000 per year.", "diff" : 3, "type" : "max_income"},

	{"text" : "Applicant must have less than $100,000 in debt.", "diff" : 1, "type" : "max_debt"},
	{"text" : "Applicant must have less than $75,000 in debt.", "diff" : 1, "type" : "max_debt"},
	{"text" : "Applicant must have less than $50,000 in debt.", "diff" : 2, "type" : "max_debt"},
	{"text" : "Applicant must have less than $25,000 in debt.", "diff" : 3, "type" : "max_debt"},
	{"text" : "Applicant must have less than $10,000 in debt.", "diff" : 3, "type" : "max_debt"},

	{"text" : "Applicant must have been employed for at least 1 year.", "diff" : 1, "type" : "min_employment"},
	{"text" : "Applicant must have been employed for at least 2 years.", "diff" : 1, "type" : "min_employment"},
	{"text" : "Applicant must have been employed for at least 3 years.", "diff" : 2, "type" : "min_employment"},
	{"text" : "Applicant must have been employed for at least 5 years.", "diff" : 2, "type" : "min_employment"},
	{"text" : "Applicant must have been employed for at least 10 years.", "diff" : 3, "type" : "min_employment"},

	{"text" : "Applicant must not request more than $100,000.", "diff" : 1, "type" : "max_loan"},
	{"text" : "Applicant must not request more than $75,000.", "diff" : 1, "type" : "max_loan"},
	{"text" : "Applicant must not request more than $50,000.", "diff" : 2, "type" : "max_loan"},
	{"text" : "Applicant must not request more than $25,000.", "diff" : 2, "type" : "max_loan"},
	{"text" : "Applicant must not request more than $10,000.", "diff" : 3, "type" : "max_loan"},

	{"text" : "Applicant must request at least $1,000.", "diff" : 1, "type" : "min_loan"},
	{"text" : "Applicant must request at least $5,000.", "diff" : 1, "type" : "min_loan"},
	{"text" : "Applicant must request at least $10,000.", "diff" : 2, "type" : "min_loan"},
	{"text" : "Applicant must request at least $25,000.", "diff" : 3, "type" : "min_loan"},

	{"text" : "Applicant must have a debt-to-income ratio under 50%.", "diff" : 1, "type" : "max_dti"},
	{"text" : "Applicant must have a debt-to-income ratio under 40%.", "diff" : 2, "type" : "max_dti"},
	{"text" : "Applicant must have a debt-to-income ratio under 35%.", "diff" : 2, "type" : "max_dti"},
	{"text" : "Applicant must have a debt-to-income ratio under 30%.", "diff" : 3, "type" : "max_dti"},

	{"text" : "Applicant must have Excellent payment history.", "diff" : 3, "type" : "payment_history"},
	{"text" : "Applicant must have Good or Excellent payment history.", "diff" : 1, "type" : "payment_history"},
	{"text" : "Applicant must have Fair or better payment history.", "diff" : 2, "type" : "payment_history"},
]

func interpret_rules(rule):
	match RULES[rule]["text"]:
		"Applicant must be 18 or older.":
			guide["min_age"] = max(guide["min_age"], 18)
			return
		"Applicant must be 21 or older.":
			guide["min_age"] = max(guide["min_age"], 21)
			return
		"Applicant must be 25 or older.":
			guide["min_age"] = max(guide["min_age"], 25)
			return
		"Applicant must be 30 or older.":
			guide["min_age"] = max(guide["min_age"], 30)
			return
		"Applicant must be 40 or older.":
			guide["min_age"] = max(guide["min_age"], 40)
			return
		"Applicant must be 50 or older.":
			guide["min_age"] = max(guide["min_age"], 50)
			return

		"Applicant must be under 90 years old.":
			guide["max_age"] = min(guide["max_age"], 90)
			return
		"Applicant must be under 80 years old.":
			guide["max_age"] = min(guide["max_age"], 80)
			return
		"Applicant must be under 70 years old.":
			guide["max_age"] = min(guide["max_age"], 70)
			return
		"Applicant must be under 65 years old.":
			guide["max_age"] = min(guide["max_age"], 65)
			return
		"Applicant must be under 60 years old.":
			guide["max_age"] = min(guide["max_age"], 60)
			return
		"Applicant must be under 50 years old.":
			guide["max_age"] = min(guide["max_age"], 50)
			return

		"Applicant must have a credit score of 500 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 500)
			return
		"Applicant must have a credit score of 550 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 550)
			return
		"Applicant must have a credit score of 600 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 600)
			return
		"Applicant must have a credit score of 620 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 620)
			return
		"Applicant must have a credit score of 650 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 650)
			return
		"Applicant must have a credit score of 680 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 680)
			return
		"Applicant must have a credit score of 700 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 700)
			return
		"Applicant must have a credit score of 720 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 720)
			return
		"Applicant must have a credit score of 750 or higher.":
			guide["min_credit_score"] = max(guide["min_credit_score"], 750)
			return

		"Applicant must have a credit score under 850.":
			guide["max_credit_score"] = min(guide["max_credit_score"], 850)
			return
		"Applicant must have a credit score under 800.":
			guide["max_credit_score"] = min(guide["max_credit_score"], 800)
			return
		"Applicant must have a credit score under 750.":
			guide["max_credit_score"] = min(guide["max_credit_score"], 750)
			return
		"Applicant must have a credit score under 700.":
			guide["max_credit_score"] = min(guide["max_credit_score"], 700)
			return

		"Applicant must earn at least $25,000 per year.":
			guide["min_income"] = max(guide["min_income"], 25000)
			return
		"Applicant must earn at least $35,000 per year.":
			guide["min_income"] = max(guide["min_income"], 35000)
			return
		"Applicant must earn at least $50,000 per year.":
			guide["min_income"] = max(guide["min_income"], 50000)
			return
		"Applicant must earn at least $65,000 per year.":
			guide["min_income"] = max(guide["min_income"], 65000)
			return
		"Applicant must earn at least $80,000 per year.":
			guide["min_income"] = max(guide["min_income"], 80000)
			return
		"Applicant must earn at least $100,000 per year.":
			guide["min_income"] = max(guide["min_income"], 100000)
			return

		"Applicant must earn less than $150,000 per year.":
			guide["max_income"] = min(guide["max_income"], 150000)
			return
		"Applicant must earn less than $100,000 per year.":
			guide["max_income"] = min(guide["max_income"], 100000)
			return
		"Applicant must earn less than $75,000 per year.":
			guide["max_income"] = min(guide["max_income"], 75000)
			return

		"Applicant must have less than $100,000 in debt.":
			guide["max_debt"] = min(guide["max_debt"], 100000)
			return
		"Applicant must have less than $75,000 in debt.":
			guide["max_debt"] = min(guide["max_debt"], 75000)
			return
		"Applicant must have less than $50,000 in debt.":
			guide["max_debt"] = min(guide["max_debt"], 50000)
			return
		"Applicant must have less than $25,000 in debt.":
			guide["max_debt"] = min(guide["max_debt"], 25000)
			return
		"Applicant must have less than $10,000 in debt.":
			guide["max_debt"] = min(guide["max_debt"], 10000)
			return

		"Applicant must have been employed for at least 1 year.":
			guide["min_employment"] = max(guide["min_employment"], 1)
			return
		"Applicant must have been employed for at least 2 years.":
			guide["min_employment"] = max(guide["min_employment"], 2)
			return
		"Applicant must have been employed for at least 3 years.":
			guide["min_employment"] = max(guide["min_employment"], 3)
			return
		"Applicant must have been employed for at least 5 years.":
			guide["min_employment"] = max(guide["min_employment"], 5)
			return
		"Applicant must have been employed for at least 10 years.":
			guide["min_employment"] = max(guide["min_employment"], 10)
			return

		"Applicant must not request more than $100,000.":
			guide["max_loan"] = min(guide["max_loan"], 100000)
			return
		"Applicant must not request more than $75,000.":
			guide["max_loan"] = min(guide["max_loan"], 75000)
			return
		"Applicant must not request more than $50,000.":
			guide["max_loan"] = min(guide["max_loan"], 50000)
			return
		"Applicant must not request more than $25,000.":
			guide["max_loan"] = min(guide["max_loan"], 25000)
			return
		"Applicant must not request more than $10,000.":
			guide["max_loan"] = min(guide["max_loan"], 10000)
			return

		"Applicant must request at least $1,000.":
			guide["min_loan"] = max(guide["min_loan"], 1000)
			return
		"Applicant must request at least $5,000.":
			guide["min_loan"] = max(guide["min_loan"], 5000)
			return
		"Applicant must request at least $10,000.":
			guide["min_loan"] = max(guide["min_loan"], 10000)
			return
		"Applicant must request at least $25,000.":
			guide["min_loan"] = max(guide["min_loan"], 25000)
			return

		"Applicant must have a debt-to-income ratio under 50%.":
			guide["max_dti"] = min(guide["max_dti"], 50)
			return
		"Applicant must have a debt-to-income ratio under 40%.":
			guide["max_dti"] = min(guide["max_dti"], 40)
			return
		"Applicant must have a debt-to-income ratio under 35%.":
			guide["max_dti"] = min(guide["max_dti"], 35)
			return
		"Applicant must have a debt-to-income ratio under 30%.":
			guide["max_dti"] = min(guide["max_dti"], 30)
			return

		"Applicant must have Excellent payment history.":
			guide["payment_history"] = ["Excellent"]
			return
		"Applicant must have Good or Excellent payment history.":
			guide["payment_history"] = ["Good", "Excellent"]
			return
		"Applicant must have Fair or better payment history.":
			guide["payment_history"] = ["Fair", "Good", "Excellent"]
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

	if Customers.customer["age"] < guide["min_age"]:
		ret = "Deny"
	if Customers.customer["age"] >= guide["max_age"]:
		ret = "Deny"

	if Customers.customer["credit score"] < guide["min_credit_score"]:
		ret = "Deny"
	if Customers.customer["credit score"] >= guide["max_credit_score"]:
		ret = "Deny"

	if guide["required_education"].size() > 0:
		if not Customers.customer["education"] in guide["required_education"]:
			ret = "Deny"

	if guide["allowed_statuses"].size() > 0:
		if not Customers.customer["status"] in guide["allowed_statuses"]:
			ret = "Deny"

	if result == ret:
		PlayerData.player_data["money"] += 50
	delete_customer(true)

func loan_approved() -> void:
	loan_complete("Approve")

func loan_denied() -> void:
	loan_complete("Deny")

func double_check_rules(d):
	var hold = []

	for rule in rules:
		var type = RULES[rule].get("type")

		if type == "age":
			if hold.has("min_age") or hold.has("max_age"):
				make_rules(d)
				return
			hold.append("min_age")
			hold.append("max_age")

		elif hold.has(type):
			make_rules(d)
			return

		else:
			hold.append(type)

	if guide["min_age"] >= guide["max_age"]:
		make_rules(d)
		return

	if guide["min_credit_score"] >= guide["max_credit_score"]:
		make_rules(d)
		return

func make_rules(diff:int):
	diff = clamp(diff, 1, 5)
	diff = 3
	
	rules = []
	
	guide["min_age"] = 0
	guide["max_age"] = 106
	guide["min_credit_score"] = 300
	guide["max_credit_score"] = 850
	guide["min_income"] = 0
	guide["max_income"] = 150000
	guide["max_debt"] = 100000
	guide["min_employment"] = 0
	guide["max_loan"] = 100000
	guide["min_loan"] = 0
	guide["max_dti"] = 100
	guide["payment_history"] = []
	
	for i in range(diff):
		var new_rule = -1
		while (new_rule<0||rules.has(new_rule))&& not len(rules) == len(RULES):
			new_rule = randi_range(0,len(RULES)-1)
		if new_rule >= 0:
			rules.append(new_rule)
	for rule in rules:
		interpret_rules(rule)
	
	double_check_rules(diff)

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
