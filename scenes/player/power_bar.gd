extends ProgressBar

func _process(_delta):
	value = get_parent().power * (100 / get_parent().max_power)
