extends Label

func _process(_delta):
	text = "x"  + str(Global.inventory["lumina"])
