extends Node

var health = 3

var inventory = {"arcane_flux" : 0, "shadonite" : 0, "lumina" : 0}

var dash_ability_enabled = false
var double_jump_ability_enabled = false
var goo_gun_ability_enabled = false
var tutorial_completed = false
var onboarding_completed = false
var is_dragging = false
var mission_title = ""
var mission_description = ""

func set_mission(title: String, description: String):
	mission_title = title
	mission_description = description

		
func add_item(count: int, item: String):
	if inventory.has(item):
		inventory[item] += count
	else:
		inventory[item] = count

func remove_item(count: int, item: String):
	if inventory.has(item):
		inventory[item] -= count
		if inventory[item] <= 0:
			inventory.erase(item)
	else:
		print("Item does not exist in inventory")
		
func add_health():
	if health < 5:
		health += 1

func remove_health():
	if health > 0:
		health -= 1

func acquire_dash_ability():
	dash_ability_enabled = true
	
func acquire_double_jump_ability():
	double_jump_ability_enabled = true
	
func acquire_goo_gun_ability():
	goo_gun_ability_enabled = true
