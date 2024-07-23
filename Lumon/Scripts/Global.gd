extends Node

var arcane_flux = 5
var shadonite = 0
var lumina = 0

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
	
