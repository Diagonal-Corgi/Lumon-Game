extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():

	if Global.tutorial_complete:
		Global.set_mission("Room 1","Fix Room 1")
		tutorial_dialogue()
	elif Global.level_1_complete:
		Global.set_mission("Room 2","Fix Room 2")
	elif Global.level_2_complete:
		Global.set_mission("Room 3","Fix Room 3")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func tutorial_dialogue():
	if Global.tutorial_completed == false:
		Dialogic.start("HQ_01")
		Global.dash_ability_enabled = false
		Global.double_jump_ability_enabled = false
		Global.goo_gun_ability_enabled = false
