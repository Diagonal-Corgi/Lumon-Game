extends Node2D
@onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("Level_02")
	Global.mission_title = "Level 2"
	Global.mission_description = "Recalibrate the multiversal scaling driver"
	animation_player.play("level_scale")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
