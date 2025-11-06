extends StaticBody2D
@onready var color_rect: ColorRect = $ColorRect
@onready var snap_marker: Marker2D = $Marker2D

func _ready() -> void:
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)
func _process(_delta):
	if Global.is_dragging: 
		visible = true
	else:
		visible = false
		print("color")
		
func snap_to_marker():
	self.global_position = snap_marker.global_position
