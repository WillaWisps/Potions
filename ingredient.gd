class_name Ingredient
extends Sprite2D

var color: IngredientColor
var value: int

enum IngredientColor {
	WHITE,
	BLUE,
	BLACK,
	GREEN,
	RED,
	PURPLE,
	YELLOW,
	ORANGE,
}

const valid_white_values := [1, 2, 3]
const valid_other_values := [1, 2, 4]
const valid_solo_values := [1]
const solo_colors := [IngredientColor.BLACK, IngredientColor.PURPLE, IngredientColor.ORANGE]

func _init(init_color: IngredientColor, init_value: int):
	# Validate value
	if init_color == IngredientColor.WHITE:
		assert(init_value in valid_white_values)
	elif init_color in solo_colors:
		assert(init_value in valid_solo_values)
	else:
		assert(init_value in valid_other_values)
	value = init_value
	color = init_color

func get_id():
	# Ingredient-ColorValue-Value
	return "I-%d-%d" % [color, value]
	
func spawn(new_position: Vector2, parent: Node):
	self.position = new_position
	parent.add_child(self)
	
func get_pot_position_increase(seen_ingredients: Dictionary):
	return value
