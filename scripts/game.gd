extends Node2D

@onready var crop_layer = $Crops

var score = 0
var currently_equipped : Item = null
var crop : Dictionary

@export var block : Dictionary[String, BlockData]

@export var bread : Item
@export var milk : Item
@export var potato : Item
@export var tomato : Item

func _ready() -> void:
	Inventory.current_scene = self
	
	Inventory.add_item(bread)
	Inventory.add_item(milk)
	Inventory.add_item(potato)
	Inventory.add_item(tomato)

#https://www.youtube.com/watch?v=iSpWZzL2i1o&t=391s 
#catshaped(on_itch)art
func update_score():
	Global.previous_score = Global.current_score
	if Global.current_score > Global.high_score:
		Global.high_score = Global.current_score
	Global.current_score = 0
#https://www.youtube.com/watch?v=fwaCY2P5UMY
#16BitDev
#https://www.youtube.com/watch?v=w1tWIw511N0

func _on_switch_scene_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/cooking_system.tscn")
