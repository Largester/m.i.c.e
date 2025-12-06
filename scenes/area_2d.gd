extends Area2D
var points_on_eat = 10


func _eaten():
	Global.current_score += points_on_eat
	self.queue_free()
