class_name Player
extends Node

var color: PlayerColor
var drop: int
var gems: int
var potion: Potion
var chest: Array

enum PlayerColor {
	BLUE,
}

func get_potion():
	if color == PlayerColor.BLUE:
		return Potion.new(color)

func _init(player_color: PlayerColor = PlayerColor.BLUE):
	drop = 0
	gems = 1
	color = player_color
	potion = get_potion()
	chest = Player.init_chest()
	
func use_potion():
	if potion.is_filled:
		potion.empty_bottle()
	else:
		potion.fill_bottle()

# -------- STATIC

static func init_chest():
	return [Ingredient.WhiteIngredient.new(1),
		Ingredient.WhiteIngredient.new(1),
		Ingredient.WhiteIngredient.new(1),
		Ingredient.WhiteIngredient.new(1),
		Ingredient.WhiteIngredient.new(2),
		Ingredient.WhiteIngredient.new(2),
		Ingredient.WhiteIngredient.new(3),
		Ingredient.new(Ingredient.IngredientColor.GREEN, 1),
		Ingredient.new(Ingredient.IngredientColor.ORANGE, 1)]
		
# --------- Handlers

func potion_handler(_viewport:Node, event:InputEvent, _shape_idx:int):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		use_potion()
