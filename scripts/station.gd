extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_Station_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.cooking()

func _on_Station_body_exited(body: Node2D) -> void:
	animation_player.play("idle")
