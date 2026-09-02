extends Node

# To DO:
'''
- stored customers (hold old customers)
'''
var customer = {}

var names = {
	"first" = ["Alex", "Avery", "Bailey", "Blake", "Cameron",
	"Casey", "Charlie", "Dakota", "Dylan", "Elliot",
	"Emery", "Finley", "Frankie", "Harley", "Hayden",
	"Jamie", "Jesse", "Jordan", "Kai", "Kendall",
	"Kerry", "Logan", "Marley", "Micah", "Morgan",
	"Parker", "Payton", "Quinn", "Reese", "Riley",
	"River", "Robin", "Rowan", "Ryan", "Sage",
	"Sam", "Sawyer", "Shane", "Skyler", "Spencer",
	"Taylor", "Terry", "Val", "Wren", "Adrian",
	"Arden", "Aspen", "August", "Billie", "Briar",
	"Brooklyn", "Charlie", "Cory", "Drew", "Eden",
	"Ellis", "Everett", "Gray", "Greer", "Jaden",
	"Jay", "Jules", "Justice", "Lane", "Lennon",
	"Linden", "London", "Lou", "Mackenzie", "Marlowe",
	"Max", "Noel", "Oakley", "Phoenix", "Presley",
	"Remy", "Rory", "Shiloh", "Sidney", "Stevie",
	"Sunny", "Toby", "Tristan", "Winter", "Zion",
	"Addison", "Blair", "Brett", "Carter", "Devon",
	"Emerson", "Gale", "Hunter", "Indigo", "Jody",
	"Kit", "Lake", "Nico", "Peyton", "Reagan"],
	"last" = ["Smith", "Johnson", "Williams", "Brown", "Jones",
	"Garcia", "Miller", "Davis", "Rodriguez", "Martinez",
	"Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson",
	"Thomas", "Taylor", "Moore", "Jackson", "Martin",
	"Lee", "Perez", "Thompson", "White", "Harris",
	"Sanchez", "Clark", "Ramirez", "Lewis", "Robinson",
	"Walker", "Young", "Allen", "King", "Wright",
	"Scott", "Torres", "Nguyen", "Hill", "Flores",
	"Green", "Adams", "Nelson", "Baker", "Hall",
	"Rivera", "Campbell", "Mitchell", "Carter", "Roberts",
	"Gomez", "Phillips", "Evans", "Turner", "Diaz",
	"Parker", "Cruz", "Edwards", "Collins", "Reyes",
	"Stewart", "Morris", "Morales", "Murphy", "Cook",
	"Rogers", "Gutierrez", "Ortiz", "Morgan", "Cooper",
	"Peterson", "Bailey", "Reed", "Kelly", "Howard",
	"Ramos", "Kim", "Cox", "Ward", "Richardson",
	"Watson", "Brooks", "Chavez", "Wood", "James",
	"Bennett", "Gray", "Mendoza", "Ruiz", "Hughes",
	"Price", "Alvarez", "Castillo", "Sanders", "Patel",
	"Myers", "Long", "Ross", "Foster", "Jimenez"]
}

func make_customer(job:String):
	##job will determine which job the customer is for.
	customer = {
	"name" = "",
	"age" = 0,
	"job" = "",
	"education" = "",
	"credit score" = "",
	"status" = "",
	}
	customer["name"] = make_name()
	customer["age"] = randi_range(1,105)
	var jobs = ["loan Officer"]
	customer["job"] = jobs[randi_range(0, len(jobs)-1)]
	var educations = ["No Education", "Highschool/GED", "Some College", "Doctorate"]
	customer["education"] = educations[randi_range(0, len(educations)-1)]
	customer["credit score"] = randi_range(300,850)
	var statuses = ["Low Class", "Middle Class", "Upper Class"]
	customer["status"] = statuses[randi_range(0, len(statuses)-1)]

func delete_customer():
	customer = {}


func make_name():
	print("Name Made!")
	return names.get("first")[randi_range(0,len(names.get("first"))-1)] +" "+ names.get("last")[randi_range(0,len(names.get("last"))-1)]

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
