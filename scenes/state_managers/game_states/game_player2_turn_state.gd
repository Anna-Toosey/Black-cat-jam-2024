extends GameState

@onready var player_2 = $"../../Player2"

func enter():
	player_2.cat_sprite.visible = true
	player_2.aiming = true
	
func exit():
	player_2.cat_sprite.visible = false
