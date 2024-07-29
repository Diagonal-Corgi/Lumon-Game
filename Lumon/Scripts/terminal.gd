extends Area2D
@onready var puzzle_1 = $"../puzzle_1"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if(area.is_in_group("player")):
		Global.check_if_can_access_terminal()
		if Global.can_access_terminal_level_1 == true:
			puzzle_1.visible = true
		else:
			puzzle_1.visible = false


func _on_area_exited(area):
	if(area.is_in_group("player")):
		puzzle_1.visible = false
