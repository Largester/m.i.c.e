extends Area2D
@onready var animated_sprite_station: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: Node2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D#station
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D#mouse
@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $ProgressBar

const min_progress = 0
const max_progress = 6
var progress = 0
#func _ready() -> void:
	#body_entered.connect(_on_body_entered)
	#body_exited.connect(_on_body_exited)
#func _on_body_exited(body: Node2D):
	#if body.name == "mouse":
		#animated_sprite.play("idle")
#func _on_body_entered(body: Area2D):
	#if body.name == "mouse":
		#animated_sprite.play("cooking")
#nonfunctional

func _ready() -> void:
	update_progress_ui()
	#timer.start() 
	#progress_bar.max_value = max_progress

func _process(_delta: float) -> void:
	progress_bar.value = progress
	if progress >= max_progress:
		progress = min_progress

func update_progress_ui():
	#set_progress_bar()
	pass

func set_progress_bar() -> void:
	#progress_bar.value = progress
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		get_tree().get_first_node_in_group("player")
		animated_sprite_station.play("cooking")
		timer.start()

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		get_tree().get_first_node_in_group("player")
		animated_sprite_station.play("inactive")
		timer.stop()
func _on_timer_timeout() -> void:
	print(progress)
	progress += 1
	#if progress < 0:
		#progress = max_progress
		#update_progress_ui()
