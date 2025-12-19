extends Area2D


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: Node2D = $"."
@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $ProgressBar
@export var item_to_give : Item
const min_progress = 0
const max_progress = 6
var progress = 0

func _ready() -> void:
	update_progress_ui()

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
		player_sprite.play("chopping")
		animated_sprite.play("chopping")
		timer.start()

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		get_tree().get_first_node_in_group("player")
		timer.stop()
func _on_timer_timeout() -> void:
	progress += 1
func finish():
	if progress >= max_progress:
		progress = min_progress
		if item_to_give != null:
			Inventory.add_item(item_to_give)
