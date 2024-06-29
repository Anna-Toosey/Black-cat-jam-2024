extends Node2D

@onready var cat_sprite = $CatSprite
@onready var power_bar = $PowerBar
@onready var yarn_sprite = $YarnSprite

var aiming: bool = false

var pivot_position: Vector2
var cursor_position: Vector2
var target_position: Vector2i
var new_pivot_position: Vector2i

var power_bar_active: bool = false
@export var max_power: int = 10
var power: float = 0
var power_direction: int = 1
@export var power_up_speed: int = 20

signal switch_player_turn

func _process(delta):
	if not aiming:
		return

	pivot_position = position
	cursor_position = get_global_mouse_position()
	target_position = pivot_position + cursor_position.direction_to(pivot_position) * (power * 10)
	cat_sprite.global_position = pivot_position + pivot_position.direction_to(cursor_position) * 16

	if power_bar_active:
		power += power_up_speed * power_direction * delta
		if power >= max_power:
			power_direction = -1
		elif power <= 0:
			power_direction = 1

func _input(event):
	if not aiming:
		return

	if event.is_action_pressed("mouse_left"):
		power_bar_active = true
		power_bar.visible = true

	if event.is_action_released("mouse_left"):
		power_bar_active = false
		new_pivot_position = target_position
		aiming = false

		power_bar.visible = false
		var yarn_move_tween = get_tree().create_tween()
		yarn_move_tween.tween_property(yarn_sprite, "global_position", Vector2(new_pivot_position), 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

		await get_tree().create_timer(0.8).timeout

		var cat_move_tween = get_tree().create_tween()
		cat_move_tween.tween_property(cat_sprite, "global_position", Vector2(Vector2(new_pivot_position) - pivot_position.direction_to(new_pivot_position) * 16), 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

		await get_tree().create_timer(0.8).timeout

		position = new_pivot_position
		yarn_sprite.global_position = position

		power = 0
		switch_player_turn.emit()
