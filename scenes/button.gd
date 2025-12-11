extends Button


@onready var table: Node2D = $".."
@onready var crafting = $"../.."
var maxNum
var num = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxNum = crafting.items.size()


func _on_pressed() -> void:
	if num < maxNum:
		num += 1
	else:
		num = 0
	text = str(num)
	table.updateTable()
	
