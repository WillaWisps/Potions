class_name Potion
extends Sprite2D

var is_filled: bool = false
var color: Player.PlayerColor = Player.PlayerColor.YELLOW
var player: Player

const empty_texture = preload("res://Images/empty.png")
const blue_filled_texture = preload("res://Images/B Potion.png")
const yellow_filled_texture = preload("res://Images/Y Potion.png")

func _init():
	set_texture(empty_texture)
	
func setup(player_color: Player.PlayerColor):
	color = player_color
	fill_bottle()

func fill_bottle():
	set_texture(map_player_color_to_potion_texture())
	is_filled = true

func _notification(notif):
	if notif == NOTIFICATION_PARENTED:
		var parent = get_parent()
		if parent is Player:
			player = parent
			setup(parent.color)

func empty_bottle():
	set_texture(empty_texture)
	is_filled = false

func map_player_color_to_potion_texture():
	if color == Player.PlayerColor.BLUE:
		return blue_filled_texture
	elif color == Player.PlayerColor.YELLOW:
		return yellow_filled_texture

# ----- Handlers
func on_use_potion(_viewport:Node, event:InputEvent, _shape_idx:int):
	if Helpers.is_left_mouse_click(event):
		if player and player.can_use_potion():
			player.use_potion()
			empty_bottle()
		elif !player: # Tester for individual scene
			if is_filled:
				empty_bottle()
			else:
				fill_bottle()

func _on_mouse_entered_potion_clickable():
	if !player or player.can_use_potion():
		Helpers.change_mouse_to_pointer()
