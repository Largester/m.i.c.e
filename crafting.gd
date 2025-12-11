extends Node2D


var recipeCount = 0
var recipe = {}
var recipeValues = {}
var recipes = {}

var items = { 3: "mixed",
			  2: "chopped",
			  1: "cooked"}


func _ready():
	load_game()

func createRecipe(rec, nam):
	recipeValues[recipeCount] = rec
	recipeCount += 1
	recipes[str(rec)] = nam
	print("New Recipe")
	print(recipes[str(rec)], " : ", rec)
	_save_game()

func save():
	var save_dict = [ recipes, 
					  recipeValues, 
					  recipeCount]
	
	return save_dict 


func _save_game(): 
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	save_game.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = _save_game().get_line
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		recipes = node_data[0]
		recipeValues = node_data[1]
		recipeCount = node_data[2]
