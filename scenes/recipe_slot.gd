extends Panel

signal selected(recipe, node)

var index := 0

var is_ready := false

func _ready() -> void:
	is_ready = true

var recipe : Recipe:
	set(value):
		recipe = value
		
		if not is_ready:
			return
		
		%Name.text = value.name
		%Product.texture = value.icon
		#loop over the ingredients of the recipe
		for ingredient in value.ingredients:
			if index >= %Ingredient.get_child_count():
				break
			var slot = %Ingredient.get_child(index)
			var amount_label = slot.find_child("Amount")
			
			if amount_label == null:
				push_error("Amount node not found in ingredient slot")
				continue
			#set icon and amount of every ingredients
			slot.texture = ingredient.icon
			amount_label.text = str(value.ingredients[ingredient])
			
			index += 1




func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			selected.emit(recipe, self)
