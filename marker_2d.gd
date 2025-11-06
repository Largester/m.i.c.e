extends Marker2D

func _daw():
	draw_circle(Vector2.ZERO, 100, Color.RED)
	
func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.BLACK

func deselect():
	modulate = Color.RED
