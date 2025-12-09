extends Area2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("draggable"):
		animated_sprite.play("Talking")
		print("Trash can destroying: ", area.name)
		var item = area.get_parent()
		if item.has_method("_eaten"):
			await get_tree().create_timer(1.0).timeout
			item._eaten()
		else:
			item.queue_free()
	


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("draggable"):
		animated_sprite.play("Unhappy")
