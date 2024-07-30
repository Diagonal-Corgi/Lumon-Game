extends Label

func _process(_delta):
	if Global.inventory.has("arcane_flux"):
		text = "x" + str(Global.inventory["arcane_flux"])
	else: 
		text = "x0"
