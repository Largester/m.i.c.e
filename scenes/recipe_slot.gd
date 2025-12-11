extends Panel


signal selected(recipe, node)

var recipe : Recipe:
	set(value):
		recipe = value
		%Name.text = value.name
		%Product.texture = value.icon
		#loop over the ingredients of the recipe
		for i in range(value.ingredients.keys()[i]):
			var key = value.ingredients.key()[i]
			#set icon and amount of every ingredients
			%Ingredient.get_child(i).texture = key.icon
			%Ingredient.get_child(i).find_child("Amount").text = str(value.ingredients[key])

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			selected.emit(recipe, self)
