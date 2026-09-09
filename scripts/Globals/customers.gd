extends Node

# To DO:
'''
- stored customers (hold old customers)
'''
var customer = {}
var names = {
	"first": [
		"Alex", "Avery", "Bailey", "Blake", "Cameron", "Casey", "Charlie", "Dakota",
		"Dylan", "Elliot", "Emery", "Finley", "Frankie", "Harley", "Hayden", "Jamie",
		"Jesse", "Jordan", "Kai", "Kendall", "Kerry", "Logan", "Marley", "Micah",
		"Morgan", "Parker", "Payton", "Quinn", "Reese", "Riley", "River", "Robin",
		"Rowan", "Ryan", "Sage", "Sam", "Sawyer", "Shane", "Skyler", "Spencer",
		"Taylor", "Terry", "Val", "Wren", "Adrian", "Arden", "Aspen", "August",
		"Billie", "Briar", "Brooklyn", "Cory", "Drew", "Eden", "Ellis", "Everett",
		"Gray", "Greer", "Jaden", "Jay", "Jules", "Justice", "Lane", "Lennon",
		"Linden", "London", "Lou", "Mackenzie", "Marlowe", "Max", "Noel", "Oakley",
		"Phoenix", "Presley", "Remy", "Rory", "Shiloh", "Sidney", "Stevie", "Sunny",
		"Toby", "Tristan", "Winter", "Zion", "Addison", "Blair", "Brett", "Carter",
		"Devon", "Emerson", "Gale", "Hunter", "Indigo", "Jody", "Kit", "Lake",
		"Nico", "Peyton", "Reagan",

		"Abigail", "Adam", "Adalyn", "Adeline", "Adrian", "Aidan", "Ainsley", "Alan",
		"Albert", "Alejandro", "Alessandra", "Alexa", "Alexander", "Alexandra", "Alice",
		"Alicia", "Alina", "Alison", "Allison", "Amelia", "Amira", "Amy", "Ana",
		"Andrea", "Andrew", "Angel", "Angela", "Angelina", "Anna", "Annabelle", "Anthony",
		"Antonio", "Arabella", "Archer", "Ari", "Aria", "Ariana", "Ariel", "Arthur",
		"Arthur", "Asher", "Ashley", "Athena", "Atlas", "Audrey", "Austin", "Autumn",
		"Ava", "Axel", "Bella", "Benjamin", "Bennett", "Bentley", "Bernard", "Bethany",
		"Bianca", "Blake", "Brady", "Braeden", "Brandon", "Brayden", "Brendan", "Brianna",
		"Brian", "Bridget", "Brielle", "Brody", "Brooke", "Bryan", "Bryce", "Caleb",
		"Callie", "Calvin", "Camden", "Camila", "Camille", "Carlos", "Caroline", "Carson",
		"Cassidy", "Catherine", "Cecilia", "Celeste", "Chad", "Chandler", "Charlotte", "Chase",
		"Chloe", "Christian", "Christina", "Christopher", "Claire", "Clara", "Clayton", "Colin",
		"Connor", "Cooper", "Cora", "Corey", "Corinne", "Courtney", "Cristian", "Crystal",
		"Cynthia", "Daisy", "Damian", "Daniel", "Daniela", "Danielle", "Dante", "David",
		"Delilah", "Derek", "Desmond", "Destiny", "Diego", "Dominic", "Dominique", "Donovan",
		"Dorothy", "Easton", "Eleanor", "Elena", "Eliana", "Elijah", "Elisa", "Elizabeth",
		"Elise", "Ella", "Ellen", "Elliana", "Elodie", "Elsie", "Emanuel", "Emilia",
		"Emily", "Emma", "Emmett", "Eric", "Erica", "Erik", "Erin", "Esme",
		"Estella", "Esther", "Ethan", "Eva", "Evan", "Evelyn", "Everett", "Faith",
		"Felix", "Fiona", "Finn", "Fisher", "Florence", "Frances", "Francis", "Frederick",
		"Gabriel", "Gabriella", "Gavin", "Gemma", "Genevieve", "George", "Georgia", "Gianna",
		"Gideon", "Giselle", "Gloria", "Grace", "Gracie", "Grant", "Grayson", "Gregory",
		"Hailey", "Hannah", "Harper", "Harrison", "Hazel", "Heidi", "Henry", "Hope",
		"Hudson", "Hugo", "Ian", "Ibrahim", "Iris", "Isabel", "Isabella", "Isaac",
		"Isla", "Ivan", "Jack", "Jackie", "Jackson", "Jacob", "Jade", "Jake",
		"James", "Jasmine", "Jason", "Javier", "Jayden", "Jeffrey", "Jenna", "Jennifer",
		"Jeremiah", "Jeremy", "Jerome", "Jillian", "Joanna", "Jocelyn", "Joel", "John",
		"Johnny", "Jonathan", "Joseph", "Josephine", "Joshua", "Josiah", "Josie", "Joy",
		"Juan", "Judah", "Julia", "Julian", "Juliana", "Juliet", "June", "Justin",
		"Kaitlyn", "Kara", "Karen", "Karina", "Katherine", "Kathryn", "Kayla", "Kaylee",
		"Keegan", "Keith", "Kelly", "Kelsey", "Kennedy", "Kevin", "Kiana", "Kimberly",
		"Kingston", "Kinsley", "Kylie", "Kyler", "Landon", "Laura", "Lauren", "Layla",
		"Leah", "Leila", "Leo", "Leon", "Leonardo", "Levi", "Liam", "Lila",
		"Lillian", "Lily", "Lincoln", "Lisa", "Lola", "Lucas", "Lucy", "Luis",
		"Luke", "Luna", "Lydia", "Madeline", "Madelyn", "Madison", "Mae", "Maeve",
		"Makayla", "Malachi", "Malcolm", "Maria", "Mariah", "Mariana", "Marie", "Marissa",
		"Mark", "Mason", "Mateo", "Matthew", "Maya", "Megan", "Melanie", "Melody",
		"Melissa", "Mia", "Michael", "Michelle", "Miguel", "Mila", "Miles", "Milo",
		"Miranda", "Molly", "Monica", "Natalia", "Natalie", "Nathan", "Nathaniel", "Nayeli",
		"Nevaeh", "Nicholas", "Nicole", "Nina", "Noah", "Nolan", "Nora", "Norah",
		"Nova", "Oliver", "Olivia", "Omar", "Opal", "Oscar", "Owen", "Paige",
		"Paisley", "Palmer", "Patricia", "Paul", "Penelope", "Peter", "Philip", "Phoebe",
		"Piper", "Preston", "Rachel", "Raegan", "Rafael", "Raiden", "Raymond", "Rebecca",
		"Reed", "Reid", "Rhett", "Ricardo", "Richard", "Robert", "Roger", "Rose",
		"Rosalie", "Roselyn", "Ruby", "Russell", "Ruth", "Sabrina", "Sadie", "Samuel",
		"Sarah", "Savannah", "Scarlett", "Sean", "Sebastian", "Serena", "Serenity", "Shane",
		"Shawn", "Shelby", "Simon", "Sofia", "Sophia", "Sophie", "Spencer", "Stella",
		"Steven", "Summer", "Susan", "Sydney", "Tanner", "Tara", "Teresa", "Theodore",
		"Thomas", "Tiffany", "Timothy", "Travis", "Trevor", "Trinity", "Tyler", "Valerie",
		"Vanessa", "Vera", "Victoria", "Vincent", "Violet", "Vivian", "Walter", "Warren",
		"Waylon", "Wesley", "Weston", "William", "Willow", "Wyatt", "Xander", "Xavier",
		"Yasmin", "Yasmine", "Zachary", "Zane", "Zara", "Zoe", "Zoey"
	],

	"last": [
		"Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis",
		"Rodriguez", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson",
		"Thomas", "Taylor", "Moore", "Jackson", "Martin", "Lee", "Perez", "Thompson",
		"White", "Harris", "Sanchez", "Clark", "Ramirez", "Lewis", "Robinson", "Walker",
		"Young", "Allen", "King", "Wright", "Scott", "Torres", "Nguyen", "Hill",
		"Flores", "Green", "Adams", "Nelson", "Baker", "Hall", "Rivera", "Campbell",
		"Mitchell", "Carter", "Roberts", "Gomez", "Phillips", "Evans", "Turner", "Diaz",
		"Cruz", "Edwards", "Collins", "Reyes", "Stewart", "Morris", "Morales", "Murphy",
		"Cook", "Rogers", "Gutierrez", "Ortiz", "Morgan", "Cooper", "Peterson", "Bailey",
		"Reed", "Kelly", "Howard", "Ramos", "Kim", "Cox", "Ward", "Richardson",
		"Watson", "Brooks", "Chavez", "Wood", "James", "Bennett", "Gray", "Mendoza",
		"Ruiz", "Hughes", "Price", "Alvarez", "Castillo", "Sanders", "Patel", "Myers",
		"Long", "Ross", "Foster", "Jimenez",

		"Powell", "Jenkins", "Perry", "Russell", "Sullivan", "Bell", "Coleman", "Butler",
		"Henderson", "Barnes", "Fisher", "Vasquez", "Simmons", "Patterson", "Jordan", "Reynolds",
		"Hamilton", "Graham", "Kim", "Gonzales", "Alexander", "Ramos", "Wallace", "Griffin",
		"West", "Cole", "Hayes", "Chambers", "Gibson", "Bryant", "Ellis", "Stevens",
		"Murray", "Ford", "Marshall", "Owens", "Mcdonald", "Harrison", "Ruiz", "Kennedy",
		"Wells", "Alvarez", "Woods", "Mendoza", "Webb", "Castillo", "Olson", "Simpson",
		"Steele", "Tucker", "Freeman", "Burns", "Henry", "Vasquez", "Snyder", "Douglas",
		"Richardson", "Robertson", "Hunt", "Black", "Ferguson", "Douglas", "Hart", "Lawson",
		"Watkins", "Hamilton", "Meyer", "Bishop", "Fowler", "Johnston", "Bradley", "Carroll",
		"Duncan", "Armstrong", "Berry", "Dixon", "Cruz", "Harvey", "Pearson", "Dean",
		"Reyes", "Warren", "Hunt", "Blackburn", "Knight", "Stone", "Hawkins", "Dunn",
		"Perkins", "Hudson", "Spencer", "Gardner", "Stephens", "Payne", "Pierce", "Berry",
		"Matthews", "Arnold", "Wagner", "Willis", "Ray", "Watkins", "Olson", "Carpenter",
		"Daniels", "Day", "Love", "Frazier", "Dale", "Holt", "Goodman", "Mills",
		"Howell", "Warner", "Parks", "Nichols", "Grant", "Knight", "Ferguson", "Rose",
		"Stone", "Harrison", "Hansen", "George", "Mason", "Porter", "Hunter", "Gordon",
		"Hicks", "Crawford", "Henry", "Boyd", "Morris", "McCarthy", "Cunningham", "Dixon",
		"Larson", "Rhodes", "Morrison", "Hammond", "Riley", "McKenzie", "McKinney", "Cannon",
		"Miranda", "Klein", "Keller", "Vaughn", "Robbins", "Curtis", "Pope", "Maldonado",
		"McDonald", "Winters", "Craig", "Decker", "Brock", "Davenport", "Sampson", "Tyson",
		"Spence", "Conley", "Mayer", "Caldwell", "Mccoy", "Mclean", "Mckay", "Fritz",
		"Fischer", "Kramer", "Schultz", "Schneider", "Weber", "Bauer", "Becker", "Krause",
		"Rich", "Blair", "Mack", "Madden", "Phelps", "Manning", "Reeves", "Shepherd",
		"Shepard", "Wilkins", "Wilkinson", "Carver", "Baxter", "Conway", "Merritt", "Nash",
		"Vance", "Pruitt", "Mccormick", "McBride", "McClure", "McGuire", "McConnell", "McDowell",
		"Farley", "Farmer", "Fletcher", "Finley", "Fleming", "Frost", "Gaines", "Gallagher",
		"Garner", "Garrett", "Garrison", "Gentry", "Gilbert", "Gill", "Gillespie", "Glass",
		"Glenn", "Golden", "Goodwin", "Graves", "Greer", "Griffith", "Gross", "Guerrero",
		"Guy", "Hahn", "Hale", "Haley", "Hancock", "Harding", "Hardy", "Harper",
		"Hartman", "Hatfield", "Hatcher", "Hayden", "Heath", "Herman", "Higgins", "Hines",
		"Hoover", "Hopkins", "Horton", "House", "Howe", "Hubbard", "Humphrey", "Hurst",
		"Ingram", "Irwin", "Jarvis", "Jefferson", "Jensen", "Jernigan", "Kane", "Kaufman",
		"Keith", "Kendall", "Kent", "Kerr", "Kincaid", "Kirby", "Kirk", "Knox",
		"Lamb", "Lancaster", "Landry", "Lane", "Lang", "Larsen", "Lawrence", "Leach",
		"Leary", "Lehman", "Lester", "Levine", "Lindsey", "Little", "Lloyd", "Logan",
		"Lucas", "Lynch", "Lyons", "Mackey", "Maddox", "Mahoney", "Malone", "Mann",
		"Marsh", "Massey", "Maxwell", "May", "Maynard", "McCall", "McClain", "McCormick",
		"McDaniel", "McGee", "McIntyre", "McLean", "McMillan", "Meadows", "Mercer", "Merrill",
		"Meyer", "Miles", "Miller", "Mills", "Monroe", "Montgomery", "Moody", "Moon",
		"Moore", "Morse", "Morton", "Moss", "Munoz", "Norris", "Norton", "Novak",
		"Osborne", "Owen", "Owens", "Page", "Palmer", "Parrish", "Parsons", "Patton",
		"Paul", "Pearce", "Peters", "Phelps", "Pickett", "Pittman", "Pollard", "Potter",
		"Pratt", "Preston", "Prince", "Quinn", "Ramsey", "Randall", "Randolph", "Rasmussen",
		"Ratliff", "Raymond", "Reeves", "Reid", "Riddle", "Riggs", "Rivers", "Roach",
		"Robbins", "Roberson", "Rocha", "Rodgers", "Rojas", "Rollins", "Roman", "Rooney",
		"Rosales", "Rosario", "Rowe", "Roy", "Royce", "Salazar", "Salinas", "Sampson",
		"Sandoval", "Sawyer", "Schmidt", "Schroeder", "Schwartz", "Schmitt", "Schroeder", "Shaffer",
		"Shannon", "Sharp", "Shelton", "Sherman", "Short", "Silva", "Simon", "Sims",
		"Singleton", "Skinner", "Slater", "Sloan", "Small", "Snyder", "Solis", "Sosa",
		"Spencer", "Stafford", "Stanley", "Stark", "Stein", "Stephenson", "Stout", "Strickland",
		"Strong", "Stuart", "Summers", "Sutton", "Swanson", "Tate", "Terrell", "Thorne",
		"Todd", "Townsend", "Travis", "Trent", "Trujillo", "Underwood", "Valdez", "Valencia",
		"Velez", "Vincent", "Wade", "Waller", "Walsh", "Walton", "Ward", "Warner",
		"Washington", "Waters", "Watson", "Weaver", "Webster", "Weeks", "Weiss", "Welch",
		"Wells", "Werner", "Wheeler", "Whitaker", "Whitehead", "Wilcox", "Wiley", "Wilkerson",
		"Williamson", "Willis", "Wilson", "Wise", "Wolfe", "Wong", "Woodard", "Wooten",
		"Wright", "Wyatt", "Yates", "York", "Young", "Zamora", "Zavala", "Zimmerman"
	]
}

func make_customer(_job:String):
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
