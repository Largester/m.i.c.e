extends Panel


signal completed(item, node)
 
var recipe : Recipe:
	set(value):
		recipe = value
 
		if value == null:
			return
		$TextureRect.texture = value.icon
		cook_time = value.cook_time
 
var cook_time : float:
	set(value):
		cook_time = value
		$ProgressBar.max_value = value
 
var time : float = 0:
	set(value):
		time = value
		$ProgressBar.value = value
 
 
func _physics_process(delta):
	if time >= 0 and get_index() == 0:
		time += delta
	if time > cook_time:
		completed.emit(recipe, self)
		queue_free()
 
 
func _on_cancel_pressed():
	queue_free()
