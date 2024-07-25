extends Node2D
@onready var f_label = $F_label
@onready var craft_panel = $Craft_Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("open_craft_menu"):
		toggle_panel_visibility()

func toggle_panel_visibility():
	# Toggle the visibility of the panel
	if craft_panel:
		craft_panel.visible = not craft_panel.visible

func _on_area_2d_area_entered(area):
	if(area.is_in_group("player")):
		f_label.visible = true


func _on_area_2d_area_exited(area):
	if(area.is_in_group("player")):
		f_label.visible = false
		craft_panel.visible = false
