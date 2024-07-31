extends Node2D
@onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("Level_02")
	Global.set_mission("Room 2", "Recalibrate the scaling driver")
	animation_player.play("level_scale")
	Global.level_2_complete = true
	Global.level_1_complete = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
