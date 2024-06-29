extends GameState

@onready var start_button = $"../../UI/StartButton"

func enter():
	pass
	
func exit():
	start_button.visible = false
