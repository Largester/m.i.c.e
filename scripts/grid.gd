extends Sprite2D

const TILE_SIZE: Vector2 = Vector2(16, 16)

var mouse_position: Vector2 = get_global_mouse_position() - TILE_SIZE/2.0


func _physics_process(_delta: float) -> void:
	global_position = get_global_mouse_position().snapped(TILE_SIZE) + TILE_SIZE/2.0
