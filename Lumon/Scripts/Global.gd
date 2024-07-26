extends Node

var arcane_flux = 0
var shadonite = 0
var lumina = 0
var health = 3

var inventory = {"arcane_flux" : 0, "shadonite" : 0, "lumina" : 0}

var dash_ability_enabled = true
var double_jump_ability_enabled = true
var goo_gun_ability_enabled = true

		
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
