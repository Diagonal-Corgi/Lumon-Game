extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.onboarding_completed ==  false:
		Dialogic.start("timeline")
		Global.double_jump_ability_enabled = true
		Global.dash_ability_enabled = true
		Global.goo_gun_ability_enabled = true
		Global.onboarding_completed = true
		Global.set_mission("Onboarding 101","Complete the training simulation")
		Global.tutorial_complete = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

