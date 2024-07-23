extends CharacterBody2D

@export var speed = 1
var player_position
var target_position
@onready var player = $"../Player"


func _physics_process(delta):
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 3:
		move_and_collide(target_position * speed)

func do_teleport(area):
	for portal in get_tree().get_nodes_in_group("portal"):
		if(portal != area):
			if(portal.id == area.id):
				if(!portal.lock_portal):
					#area.lock_portal = true
					area.do_lock()
					global_position = portal.global_position

func _on_area_2d_area_entered(area):
	if(area.is_in_group("portal")):
		if(!area.lock_portal):
			do_teleport(area)
