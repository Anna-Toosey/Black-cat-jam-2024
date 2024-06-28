extends Node2D

@export var aiming_line_thickness: int = 2
@export var cat_to_line_radius: int = 10

func _process(_delta):
	position = get_global_mouse_position()
