extends Node2D
@onready var hud = $Player/Camera2D/HUD


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.onboarding_completed ==  false:
		Dialogic.start("timeline")
		Global.double_jump_ability_enabled = true
		Global.dash_ability_enabled = true
		Global.goo_gun_ability_enabled = true
		Global.onboarding_completed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
