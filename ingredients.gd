class_name Ingredient

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

