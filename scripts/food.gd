extends Node2D

var points_on_eat = 10

func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
func _eaten():
	Global.current_score += points_on_eat
	self.queue_free()
