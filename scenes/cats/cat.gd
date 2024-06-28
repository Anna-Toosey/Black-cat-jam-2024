extends CharacterBody2D

@export var aiming: bool = false
@onready var aiming_cursor = $AimingCursor

func _process(_delta):
	queue_redraw()

func _draw():
	var cat_position: Vector2 = global_position - position
	var aiming_cursor_position = aiming_cursor.position - position

	if aiming and cat_position.distance_to(aiming_cursor_position) >= aiming_cursor.cat_to_line_radius:
		draw_line(cat_position + cat_position.direction_to(aiming_cursor_position) * aiming_cursor.cat_to_line_radius, aiming_cursor_position, Color.WHITE, aiming_cursor.aiming_line_thickness)
