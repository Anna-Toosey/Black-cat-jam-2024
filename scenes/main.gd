extends Node2D

@onready var game_state_machine: GameStateMachine = $GameStateMachine as GameStateMachine
@onready var player = $Player

func _ready():
	game_state_machine.init()

func _process(_delta):
	queue_redraw()

func _draw():
	if player.aiming and player.pivot_position.distance_to(player.cursor_position) >= 24:
		draw_line(player.pivot_position + player.pivot_position.direction_to(player.cursor_position) * 24, player.cursor_position, Color.SKY_BLUE, 2)
