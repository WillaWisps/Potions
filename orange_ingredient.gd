class_name OrangeIngredient
extends Ingredient

const orange_1_texture = preload("res://Images/O.png")

func _init(init_value: int):
	super(Ingredient.IngredientColor.ORANGE, init_value)
	scale = Vector2(0.2, 0.2)
	setup_texture()

func setup_texture():
	if value == 1:
		set_texture(orange_1_texture)
