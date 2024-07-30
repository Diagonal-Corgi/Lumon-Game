extends Label

func _process(_delta):
	if Global.inventory.has("shadonite"):
		text = "x" + str(Global.inventory["shadonite"])
	else: 
		text = "x0"
