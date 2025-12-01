extends Node2D

var score = 0



func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

#https://www.youtube.com/watch?v=iSpWZzL2i1o&t=391s 
#catshaped(on_itch)art
func update_score():
	Global.previous_score = Global.current_score
	if Global.current_score > Global.high_score:
		Global.high_score = Global.current_score
	Global.current_score = 0
