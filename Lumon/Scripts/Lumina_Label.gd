extends Label

func _process(_delta):
	if Global.inventory.has("lumina"):
		text = "x" + str(Global.inventory["lumina"])
	else: 
		text = "x0"
