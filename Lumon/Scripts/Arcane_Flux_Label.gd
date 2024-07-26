extends Label

func _process(_delta):
	text = "x" + str(Global.inventory["arcane_flux"])
