extends Node2D
@onready var f_label = $F_label
@onready var craft_panel = $CraftPanel
@onready var item_list = $CraftPanel/ItemList
@onready var request_button = $CraftPanel/RequestButton

var selected_item = 999

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

func request_item(index):
	if index == 0: # DASH
		if Global.lumina >= 2 && Global.shadonite >= 2:
			request_button.disabled = false
		else: 
			request_button.disabled = true
	elif index == 1: #DOUBLE JUMP
		if Global.lumina >= 2 && Global.shadonite >= 2 && Global.arcane_flux >= 4:
			request_button.disabled = false
		else: 
			request_button.disabled = true
	elif index == 2: # GOO GUN
		if Global.lumina >= 2 && Global.shadonite >= 2 && Global.arcane_flux >= 1:
			request_button.disabled = false
		else: 
			request_button.disabled = true
		
	
func _on_request_button_pressed():
	match selected_item:
		"Dash":
			Global.dash_ability_enabled = true
			item_list.set_item_text(0, "Acquired")
			item_list.set_item_disabled(0, true)
		"Double Jump":
			Global.double_jump_ability_enabled = true
			item_list.set_item_text(1, "Acquired")
			item_list.set_item_disabled(1, true)
		"Goo Gun":
			Global.goo_gun_ability_enabled = true
			item_list.set_item_text(2, "Acquired")
			item_list.set_item_disabled(2, true)

func _on_item_list_item_selected(index):
		request_item(index)
		selected_item = item_list.get_item_text(index)
