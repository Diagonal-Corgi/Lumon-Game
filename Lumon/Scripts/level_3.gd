extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("Level_03")
	Global.set_mission("Room 3", "Recalibrate the rotational processing unit")
	Global.level_3_complete = true
	Global.level_2_complete = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
