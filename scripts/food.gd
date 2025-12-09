extends Node2D

var points_on_eat = 10
var follow_mouse = true

func _process(_delta: float) -> void:
	if follow_mouse:
		global_position = get_global_mouse_position()
func _eaten():
	Global.current_score += points_on_eat
	self.queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("stoparea"):
		follow_mouse = false
