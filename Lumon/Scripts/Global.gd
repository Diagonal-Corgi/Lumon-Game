extends Node

var arcane_flux = 99
var shadonite = 99
var lumina = 99
var health = 3

var dash_ability_enabled = true
var double_jump_ability_enabled = true
var goo_gun_ability_enabled = true

func add_arcane_flux():
	arcane_flux += 1

func remove_arcane_flux():
	if arcane_flux > 0:
		arcane_flux -= 1
	else:
		print("Player dead")
		
func add_shadonite():
	shadonite += 1
	
func add_lumina():
	lumina += 1
	
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
