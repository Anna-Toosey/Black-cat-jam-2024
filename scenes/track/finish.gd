extends Area2D

@onready var player_one = $"../Player1"
@onready var player_two = $"../Player2"

@onready var first_finisher = null
@onready var second_finisher = null

signal player_one_wins
signal player_two_wins

func _on_area_entered(area):
	area.get_parent().finished = true

	if area.get_parent() == second_finisher:
		determine_distance_winner()
	else:
		if first_finisher == null:
			first_finisher = area.get_parent()
			if first_finisher == player_one:
				second_finisher = player_two
			elif first_finisher == player_two:
				second_finisher = player_one

		if first_finisher.turn_count <= second_finisher.turn_count:
			if first_finisher == player_one:
				player_one_wins.emit()
			elif first_finisher == player_two:
				end_race()
				player_two_wins.emit()
		else:
			second_finisher.last_turn = true

func determine_distance_winner():
	end_race()
	if player_one.travel_distance <= player_two.travel_distance:
		player_one_wins.emit()
	elif player_two.travel_distance < player_two.travel_distance:
		player_two_wins.emit()

func _on_player_1_first_finisher_wins():
	player_two_wins.emit()

func _on_player_2_first_finisher_wins():
	player_one_wins.emit()

func end_race():
	player_one.race_ended = true
	player_two.race_ended = true
