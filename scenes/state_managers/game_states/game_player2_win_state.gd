extends GameState
@onready var player_2_win = $"../../UI/Player2Win"

func enter():
		player_2_win.visible = true
	
func exit():
	pass
