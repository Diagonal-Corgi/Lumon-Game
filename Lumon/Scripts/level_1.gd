extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("Level_01")
	Global.mission_title = "Level 1"
	Global.mission_description = "Find 4 missing mainframe fragments"
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
