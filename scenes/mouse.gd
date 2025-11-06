extends Node2D
@onready var marker_2d: Marker2D = $Marker2D

var selected = false 
var rest_point
var rest_nodes = []
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()


func _on_Area_2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true

func _physics_process(delta: float) -> void:
	if selected: 
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position())
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		rotation = lerp_angle(rotation, 0, 10 * delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_distance = 100
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_distance:
					child.select()
					rest_point = child.global_position
					shortest_distance = distance
