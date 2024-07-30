extends Node2D
@onready var f_label = $F_label
@onready var craft_panel = $CraftPanel
@onready var item_list = $CraftPanel/ItemList
@onready var request_button = $CraftPanel/RequestButton
var within_area = false

var selected_item = 999

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("open_craft_menu") and within_area == true:
		toggle_panel_visibility()

func toggle_panel_visibility():
	# Toggle the visibility of the panel
	if craft_panel:
		craft_panel.visible = not craft_panel.visible

func _on_area_2d_area_entered(area):
	if(area.is_in_group("player")):
		f_label.visible = true
		within_area = true


func _on_area_2d_area_exited(area):
	if(area.is_in_group("player")):
		f_label.visible = false
		craft_panel.visible = false
		within_area = false

func request_item(index):
	if index == 0: # DASH
		if Global.inventory["lumina"] >= 2 && Global.inventory["shadonite"] >= 2:
			request_button.disabled = false
		else: 
			request_button.disabled = true
	elif index == 1: #DOUBLE JUMP
		if Global.inventory["lumina"] >= 2 && Global.inventory["shadonite"] >= 2 && Global.inventory["arcane_flux"] >= 4:
			request_button.disabled = false
		else: 
			request_button.disabled = true
	elif index == 2: # GOO GUN
		if Global.inventory["lumina"] >= 1 && Global.inventory["shadonite"] >= 1 && Global.inventory["arcane_flux"] >= 1:
			request_button.disabled = false
		else: 
			request_button.disabled = true
		
	
func _on_request_button_pressed():
	match selected_item:
		"Dash":
			Global.dash_ability_enabled = true
			item_list.set_item_text(0, "Acquired")
			item_list.set_item_disabled(0, true)
			Global.remove_item(2, "lumina")
			Global.remove_item(2, "shadonite")
		"Double Jump":
			Global.double_jump_ability_enabled = true
			item_list.set_item_text(1, "Acquired")
			item_list.set_item_disabled(1, true)
			Global.remove_item(2, "lumina")
			Global.remove_item(2, "shadonite")
			Global.remove_item(4, "arcane_flux")
		"Goo Gun":
			Global.goo_gun_ability_enabled = true
			item_list.set_item_text(2, "Acquired")
			item_list.set_item_disabled(2, true)
			Global.remove_item(1, "lumina")
			Global.remove_item(1, "shadonite")
			Global.remove_item(1, "arcane_flux")

func _on_item_list_item_selected(index):
		request_item(index)
		selected_item = item_list.get_item_text(index)
