extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.onboarding_completed ==  false:
		Dialogic.start("timeline")
		Global.onboarding_completed = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
