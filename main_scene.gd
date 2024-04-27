class_name MainScene
extends Node2D

var turn: int # add stages later
var active_player: Player

func init_board():
	turn = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	init_board() # For now call init_board
	active_player = Player.new(Player.PlayerColor.BLUE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
