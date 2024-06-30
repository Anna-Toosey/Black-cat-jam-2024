class_name GameState
extends Node

enum State {START, PLAYER1TURN, PLAYER2TURN, PLAYER1WIN, PLAYER2WIN}

signal transition_requested(from: GameState, to: State)

@export var state: State

func enter() -> void:
	pass

func exit() -> void:
	pass
