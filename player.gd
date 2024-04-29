class_name Player
extends Node

var potion_scene = preload("res://potion.tscn")

var color: PlayerColor
var gems: int
var potion: Potion
var pot: Pot

enum PlayerColor {
	BLUE,
	YELLOW
}

func _init(player_color: PlayerColor = PlayerColor.BLUE):
	gems = 1
	color = player_color
	pot = Pot.new()

func _ready():
	potion = $Potion
	
func draw_ingredient():
	if pot.is_finished() or pot.is_blown_up():
		print("Oh you're done!")
		return
	var pot_results = pot.draw_ingredient()
	pot_results.ingredient.spawn(pot_results.position, self)
	pot_results.ingredient.add_to_group("ingredients")
	if pot_results.finished or pot_results.blown_up:
		Helpers.change_mouse_to_arrow()

func can_use_potion() -> bool:
	return potion.is_filled and !pot.is_empty() and !pot.is_blown_up()

func use_potion():
	if can_use_potion():
		var ingredient = pot.return_last_ingredient()
		remove_child(ingredient)

# --------- Handlers

func on_chest_click(_viewport, event, _shape_idx):
	if Helpers.is_left_mouse_click(event):
		draw_ingredient()

func on_mouse_entered_chest_clickable():
	if !pot.is_finished() and !pot.is_blown_up(): 
		Helpers.change_mouse_to_pointer()
