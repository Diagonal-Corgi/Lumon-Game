extends Area2D
@onready var level_3 = $"."
@onready var label = $Label
var within_area = false
@onready var panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("F") and within_area == true:
		panel.visible = true

func _on_area_entered(area):
	if(area.is_in_group("player")):
		within_area = true
		label.visible = true


func _on_area_exited(_area):
	label.visible = false
	within_area = false


func _on_button_pressed():
		get_tree().change_scene_to_file("res://Scenes/thanks_for_playing.tscn")
