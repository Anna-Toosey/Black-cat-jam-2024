extends CharacterBody2D

var speed: int = 250
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	var inputDirection = Input.get_vector("left", "right", "up", "down")
	velocity = inputDirection * speed
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_input()
	move_and_slide()

