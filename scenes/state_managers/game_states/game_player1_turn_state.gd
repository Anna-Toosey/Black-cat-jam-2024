extends GameState

@onready var player_1 = $"../../Player1"

func enter():
	player_1.cat_sprite.visible = true
	player_1.aiming = true
	
func exit():
	player_1.cat_sprite.visible = false
