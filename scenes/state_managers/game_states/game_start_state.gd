extends GameState

@onready var start_button = $"../../UI/StartButton"
@onready var title_background = $"../../UI/TitleBackground"

func exit():
	start_button.visible = false
	title_background.visible = false
