extends Node2D

@onready var game_state_machine: GameStateMachine = $GameStateMachine as GameStateMachine
@onready var player_one = $Player1
@onready var player_two = $Player2

func _ready():
	game_state_machine.init()

func _process(_delta):
	queue_redraw()

func _draw():
	if player_one.aiming and player_one.pivot_position.distance_to(player_one.cursor_position) >= 24:
		draw_line(player_one.pivot_position + player_one.pivot_position.direction_to(player_one.cursor_position) * 24, player_one.cursor_position, Color.SKY_BLUE, 2)

	if player_two.aiming and player_two.pivot_position.distance_to(player_two.cursor_position) >= 24:
		draw_line(player_two.pivot_position + player_two.pivot_position.direction_to(player_two.cursor_position) * 24, player_two.cursor_position, Color.CRIMSON, 2)

func _on_start_button_pressed():
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.PLAYER1TURN)

func _on_player_1_switch_player_turn():
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.PLAYER2TURN)

func _on_player_2_switch_player_turn():
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.PLAYER1TURN)

func _on_finish_player_one_wins():
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.PLAYER1WIN)

func _on_finish_player_two_wins():
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.PLAYER2WIN)
