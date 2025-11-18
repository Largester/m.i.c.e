extends Area2D

@onready var mouse: Node2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		get_tree().get_first_node_in_group("player")
		mouse.animated_sprite_2d.play("cooking")

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		get_tree().get_first_node_in_group("player")
		mouse.animated_sprite_2d.play("inactive")
