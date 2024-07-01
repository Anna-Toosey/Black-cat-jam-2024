extends GameState

@onready var player_1_win = $"../../UI/Player1Win"

func enter():
	player_1_win.visible = true
	
func exit():
	pass
