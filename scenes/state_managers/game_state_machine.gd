class_name GameStateMachine
extends Node

@onready var game_state_label = $GameStateLabel
@export var initial_state: GameState
var current_state: GameState
var states := {}

func init() -> void:
	for child in get_children():
		if child is GameState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)

	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	game_state_label.text = str(current_state.name)

func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func _on_transition_requested(from: GameState, to: GameState.State) -> void:
	if from != current_state:
		return

	var new_state: GameState = states[to]
	if not new_state:
		return

	if current_state:
		current_state.exit()

	new_state.enter()
	current_state = new_state
