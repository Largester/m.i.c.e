extends Area2D


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: Node2D = $"."
@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $ProgressBar


const min_progress = 0
const max_progress = 6
var progress = 0

func _ready() -> void:
	update_progress_ui()
	#timer.start() 
	#progress_bar.max_value = max_progress

func _process(_delta: float) -> void:
	progress_bar.value = progress
	finish()

func update_progress_ui():
	#set_progress_bar()
	pass

func set_progress_bar() -> void:
	#progress_bar.value = progress
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		var player_root = area.get_parent()
		var player_sprite = player_root.get_node("AnimatedSprite2D")
		player_sprite.play("cooking")
		animated_sprite.play("cooking")
		timer.start()

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		player.get_node("AnimatedSprite2D").play("idle")
		animated_sprite.play("idle")
		timer.stop()
		
func _on_timer_timeout() -> void:
	print(progress)
	progress += 1
	#if progress < 0:
		#progress = max_progress
		#update_progress_ui()

func finish():
	if progress >= max_progress:
		progress = min_progress
