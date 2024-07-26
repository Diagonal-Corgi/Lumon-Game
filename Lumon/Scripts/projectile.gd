extends CharacterBody2D
@onready var timer = $Timer

# Speed of the projectile
var speed = 400
# Direction the projectile is moving in
var direction = Vector2.RIGHT
var enemy_contact = false

func _ready():
	# Set the initial direction (you can set this dynamically when instantiating the projectile)
	direction = direction.normalized()
	timer.wait_time = 2.0
	timer.start()

func _physics_process(delta):
	# Move the projectile
	var velocity = direction * speed * delta
	var collision = move_and_collide(velocity)

# Set the direction based on an angle (in radians)
func set_direction_angle(angle):
	direction = Vector2(cos(angle), sin(angle)).normalized()

func _on_area_2d_area_entered(area):
	if(area.is_in_group("portal")):
		if(!area.lock_portal):
			do_teleport(area)
			
func do_teleport(area):
	for portal in get_tree().get_nodes_in_group("portal"):
		if(portal != area):
			if(portal.id == area.id):
				if(!portal.lock_portal):
					#area.lock_portal = true
					area.do_lock()
					global_position = portal.global_position


func _on_timer_timeout():
	print("timeout")
	queue_free()
