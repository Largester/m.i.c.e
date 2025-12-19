extends Panel

signal selected(item: Recipe, node: Panel)

var index := 0
var _recipe : Recipe
var is_ready := false

func _ready() -> void:
	is_ready = true

var recipe : Recipe:
	get:
		return _recipe
	set(value):
		_recipe = value
		
		if not is_ready:
			return
		
		%Name.text = value.name
		%Product.texture = value.icon
		
		index = 0 # reset index
		#loop over the ingredients of the recipe
		for ingredient in value.ingredients:
			if index >= %Ingredient.get_child_count():
				break
			var slot = %Ingredient.get_child(index)
			var amount_label = slot.find_child("Amount", true, false)
			
			if amount_label == null:
				push_error("Amount node not found in ingredient slot" + slot.name)
				continue
			#set icon and amount of every ingredients
			slot.texture = ingredient.icon
			amount_label.text = str(value.ingredients[ingredient])
			
			index += 1
			for c in slot.get_children():
				print(c.name)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if recipe == null:
			push_warning("clicked a slot with no recipe assigned!")
			return
		print("Clicked:", recipe.name)
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("selected", recipe, self)
