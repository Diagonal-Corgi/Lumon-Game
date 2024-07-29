extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	tutotial_dialogue()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func tutotial_dialogue():
	if Global.tutorial_completed == false:
		Dialogic.start("HQ_01")
		Global.tutorial_completed = true
