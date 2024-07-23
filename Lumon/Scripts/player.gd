extends CharacterBody2D

@onready var sprite_2d = $Sprite2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
const DASH_SPEED = 300.0
const DASH_DURATION = 0.2
const DASH_COOLDOWN = 0.5

var dash_velocity = 100
var jump_count = 0
var max_jumps = 2
var is_dashing = false
var dash_timer = 0.0
var dash_direction = Vector2.ZERO
var dash_cooldown_timer = 0.0

var portal_id = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY	
		jump_count += 1

	if is_on_floor():
		jump_count = 0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
		# Handle dash input.
	if Input.is_action_just_pressed("Dash") and dash_cooldown_timer <= 0:
		start_dash()

 # Handle dash movement.
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0:
			stop_dash()
		else:
			velocity = dash_direction * DASH_SPEED
	else:
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if direction > 0:
			sprite_2d.flip_h = true
		elif direction < 0:
			sprite_2d.flip_h = false	
					# Update dash cooldown timer.
		if dash_cooldown_timer > 0:
			dash_cooldown_timer -= delta
		
	# Move and detect collisions
	var collision = move_and_collide(velocity * delta)
	if collision:
	# Push RigidBody2D if colliding
		if collision.get_collider() is RigidBody2D:
			collision.get_collider().apply_central_impulse(velocity * 0.1)
			
	move_and_slide()
			
func start_dash():
	is_dashing = true
	dash_timer = DASH_DURATION
	dash_cooldown_timer = DASH_COOLDOWN
	dash_direction = Vector2(Input.get_axis("ui_left", "ui_right"), 0).normalized()
	if dash_direction == Vector2.ZERO:
		dash_direction = Vector2(1 if sprite_2d.flip_h else -1, 0)
		
func stop_dash():
	is_dashing = false

func do_teleport(area):
	for portal in get_tree().get_nodes_in_group("portal"):
		if(portal != area):
			if(portal.id == area.id):
				if(!portal.lock_portal):
					#area.lock_portal = true
					area.do_lock()
					global_position = portal.global_position


func _on_area_2d_area_entered(area):
	if(area.is_in_group("lumina")):
		print("lumina")
	elif(area.is_in_group("shadonite")):
		print("shadonite")
	elif(area.is_in_group("arcane flux")):
		print("arcane flux")
	elif(area.is_in_group("portal")):
		if(!area.lock_portal):
			do_teleport(area)
