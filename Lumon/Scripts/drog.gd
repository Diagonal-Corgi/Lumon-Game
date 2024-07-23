extends CharacterBody2D

@export var speed = 100
@onready var player = $"../Player"

var player_position
var target_position
var facing_right = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	elif $RayCast2D2.is_colliding() && is_on_floor():
		flip()
	elif $RayCast2D3.is_colliding() && is_on_floor():
		flip()
	
		# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	velocity.x = speed
	move_and_slide()
			

func flip():
	facing_right = !facing_right
	scale.x = abs(scale.x) * -1
	
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1
	
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

			
			


func _on_hit_box_area_entered(area):
	if area.is_in_group("player"):
		Global.remove_arcane_flux()
		print("Player Damaged")
