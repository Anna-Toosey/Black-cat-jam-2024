extends Node2D

@onready var cat_sprite = $CatSprite

@export var aiming: bool = false

var pivot_position: Vector2
var cursor_position: Vector2
var target_position: Vector2i

func _process(_delta):
	if not aiming:
		return

	pivot_position = position
	cursor_position = get_global_mouse_position()
	target_position = pivot_position + cursor_position.direction_to(pivot_position) * 100
	cat_sprite.global_position = pivot_position + pivot_position.direction_to(cursor_position) * 16
