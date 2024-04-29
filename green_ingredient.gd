class_name GreenIngredient
extends Ingredient

const green_1_texture = preload("res://Images/G1.png")
const green_2_texture = preload("res://Images/G2.png")
const green_4_texture = preload("res://Images/G4.png")

func _init(init_value: int):
	super(Ingredient.IngredientColor.GREEN, init_value)
	scale = Vector2(0.2, 0.2)
	setup_texture()

func setup_texture():
	match value:
		1:
			set_texture(green_1_texture)
		2: 
			set_texture(green_2_texture)
		4:
			set_texture(green_4_texture)
