class_name Potion
extends Sprite2D

var is_filled: bool
var color: Player.PlayerColor

const empty_texture = preload("res://Images/empty.png")
const blue_filled_texture = preload("res://Images/B Potion.png")

func _init(player_color: Player.PlayerColor = Player.PlayerColor.BLUE):
	setup(player_color)
	
func setup(player_color: Player.PlayerColor):
	color = player_color
	fill_bottle()

func fill_bottle():
	set_texture(map_player_color_to_potion_texture())
	is_filled = true

func empty_bottle():
	set_texture(empty_texture)
	is_filled = false

func map_player_color_to_potion_texture():
	if color == Player.PlayerColor.BLUE:
		return blue_filled_texture

# TESTER FUNCTIONS
func test_potion_handler(_viewport:Node, event:InputEvent, _shape_idx:int):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if is_filled:
			empty_bottle()
		else:
			fill_bottle()
