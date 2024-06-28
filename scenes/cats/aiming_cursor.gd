extends Node2D

@export var aiming_line_thickness: int = 2
@export var cat_to_pivot_inner_radius: int = 10
@export var cat_to_pivot_outer_radius: int = 60
@export var pivot_to_cat_radius: int = 70


func _process(_delta):
	position = get_global_mouse_position()
