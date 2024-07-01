extends Area2D

@onready var yarn_animated_sprite = $YarnAnimatedSprite

func _ready():
	yarn_animated_sprite.play("idle")
