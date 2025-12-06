extends Area2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("draggable"):
		print("Trash can destroying: ", area.name)
		var item = area.get_parent()
		if item.has_method("_eaten"):
			item._eaten()
		else:
			item.queue_free()
		animated_sprite.play("Talking")
	


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("draggable"):
		animated_sprite.play("Unhappy")
