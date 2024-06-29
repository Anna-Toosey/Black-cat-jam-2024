extends GameState

@onready var start_button = $"../../UI/StartButton"

func exit():
	start_button.visible = false
