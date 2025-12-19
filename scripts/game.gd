extends Node2D

@onready var crop_layer = $Crops

var score = 0
var currently_equipped : Item = null
var crop : Dictionary

@export var block : Dictionary[String, BlockData]

func _ready() -> void:
	Inventory.current_scene = self
	
	Inventory.Item.add_item("Bread")

func _process(_delta: float) -> void:
	pass

#https://www.youtube.com/watch?v=iSpWZzL2i1o&t=391s 
#catshaped(on_itch)art
func update_score():
	Global.previous_score = Global.current_score
	if Global.current_score > Global.high_score:
		Global.high_score = Global.current_score
	Global.current_score = 0
#https://www.youtube.com/watch?v=fwaCY2P5UMY
