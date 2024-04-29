class_name WhiteIngredient
extends Ingredient

const white_1_texture = preload("res://Images/W1.png")
const white_2_texture = preload("res://Images/W2.png")
const white_3_texture = preload("res://Images/W3.png")

func _init(init_value: int):
	super(Ingredient.IngredientColor.WHITE, init_value)
	scale = Vector2(0.095, 0.095)
	setup_texture()

func setup_texture():
	match value:
		1:
			set_texture(white_1_texture)
		2: 
			set_texture(white_2_texture)
		3:
			set_texture(white_3_texture)
