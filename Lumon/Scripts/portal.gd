extends Area2D

@export var id: int = 0

var lock_portal = false

func do_lock():
	lock_portal = true
	await get_tree().create_timer(0.3).timeout
	lock_portal = false
