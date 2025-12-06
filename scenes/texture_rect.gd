extends TextureRect


var is_dragging := false

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		is_dragging = true
	elif event is InputEventMouseButton and not event.pressed:
		is_dragging = false

func _process(_delta):
	if is_dragging:
		global_position = get_global_mouse_position()
