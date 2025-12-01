extends Node2D

var points_on_eat = 10

func _process(_delta: float) -> void:
	Global.current_score += points_on_eat
func _eaten():
	Global.current_score += points_on_eat
	self.queue_free()
