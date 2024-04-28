class_name Player
extends Node

var potion_scene = preload("res://potion.tscn")

var color: PlayerColor
var drop: int
var gems: int
var potion: Potion
var chest: Array

enum PlayerColor {
	BLUE,
	YELLOW
}

func _init(player_color: PlayerColor = PlayerColor.BLUE):
	drop = 0
	gems = 1
	color = player_color
	chest = Player.init_chest()

func _ready():
	potion = $Potion

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
