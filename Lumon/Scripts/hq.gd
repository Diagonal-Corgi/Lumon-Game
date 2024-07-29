extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	tutorial_dialogue()
	Global.set_mission("Level 1","Complete level 1")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func tutorial_dialogue():
	if Global.tutorial_completed == false:
		Dialogic.start("HQ_01")
		Global.tutorial_completed = true
		Global.dash_ability_enabled = false
		Global.double_jump_ability_enabled = false
		Global.goo_gun_ability_enabled = false
