extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var mouse: Node2D = $"."
@onready var snap_marker: Marker2D = $Area2D/Marker2D


var draggable = false
var is_inside_dropable = false
var body_ref 
var offset: Vector2
var initialPos : Vector2
var distance_to_marker = global_position.distance_to(snap_marker.global_position)
var nearest_snap_point: Node2D = null
var SPEED = 1
var pickedup = false
var can_pickup = false
var on_floor = false
var snap_threshold = 50
const GRAVITY = 10


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and can_pickup:
			if pickedup == false:
				pickedup = true
			else:
				pickedup = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
			if Input.is_action_pressed("click"):
				global_position = get_global_mouse_position() - offset
			elif Input.is_action_just_released("click"):
				Global.is_dragging = false
				var tween = get_tree().create_tween()
				if is_inside_dropable:
					tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
				else:
					tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)
	if not on_floor and not pickedup:
		position.y += GRAVITY * delta
	elif pickedup == true:
		position = get_global_mouse_position()

func _on_mouse_button_released():
	Global.is_dragging = false
	if distance_to_marker < snap_threshold:
		global_position = snap_marker.global_position
	if distance_to_marker < snap_threshold:
			global_position = snap_marker.global_position

func _on_area_2d_mouse_entered() -> void:
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)
	can_pickup = true
func _on_area_2d_mouse_exited() -> void:
	if not Global.is_dragging: 
		draggable = false
		scale = Vector2(1,1)
	can_pickup = false
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body
	on_floor = true
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group('dropable') and body_ref == body:
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
	on_floor = false
