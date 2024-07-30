extends Area2D
@onready var level_2 = $"."
@onready var label = $Label
var within_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("F") and within_area == true:
		print("calibration complete")

func _on_area_entered(area):
	if(area.is_in_group("player")):
		within_area = true
		label.visible = true


func _on_area_exited(area):
	label.visible = false
	within_area = false
