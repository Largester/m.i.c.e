extends Control

@onready var recipe_slot_node : PackedScene = preload("res://scenes/recipe_slot.tscn")

@export var recipes : Array[Recipe]

@export var recipe_container : VBoxContainer
