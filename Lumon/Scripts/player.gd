extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimatedSprite2D/HitBox/AnimationPlayer
var ProjectileScene = preload("res://Scenes/projectile.tscn")

const SPEED = 100.0
const JUMP_VELOCITY = -290.0
const DASH_SPEED = 300.0
const DASH_DURATION = 0.2
const DASH_COOLDOWN = 0.5

var dash_velocity = 100
var jump_count = 0
var max_jumps = 1
var is_jumping = false
var is_dashing = false
var dash_timer = 0.0
var dash_direction = Vector2.ZERO
var dash_cooldown_timer = 0.0
var melee_attack_damage = 1
var portal_id = 0
var aiming_line = Line2D.new()
var is_flipped = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass
	
func _physics_process(delta):
	# Add the gravity.

	if velocity.x == 0 && velocity.y == 0 :
		animated_sprite_2d.play("idle")
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("ranged_attack") && Global.goo_gun_ability_enabled:
		shoot()
	
	if Input.is_action_just_pressed("melee_attack"):
		melee_attack()
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY	
		jump_count += 1
		if is_dashing == false:
			animated_sprite_2d.play("jump")
		if is_jumping && !is_on_floor():
			animated_sprite_2d.play("double_jump")
	if is_on_floor():
		jump_count = 0
		is_jumping = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.	
		# Handle dash input.
	if Input.is_action_just_pressed("Dash") and dash_cooldown_timer <= 0 && Global.dash_ability_enabled:
		animated_sprite_2d.play("dash")
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
			if is_on_floor() && is_dashing == false:
				animated_sprite_2d.play("run")
			else:
				animated_sprite_2d.play("jump")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if direction > 0:
			animated_sprite_2d.flip_h = false
			is_flipped = false
		elif direction < 0:
			animated_sprite_2d.flip_h = true	
			is_flipped = true
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
		dash_direction = Vector2(-1 if animated_sprite_2d.flip_h else 1, 0)
		
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
	elif(area.is_in_group("transition_hq")):
		get_tree().change_scene_to_file("res://Scenes/hq.tscn")
	elif(area.is_in_group("transition_game_1")):
		get_tree().change_scene_to_file("res://Scenes/game_1.tscn")
	elif(area.is_in_group("transition_level_1")):
		get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	elif(area.is_in_group("transition_level_2")):
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	elif(area.is_in_group("transition_level_3")):
		get_tree().change_scene_to_file("res://Scenes/level_3.tscn")

# Function to shoot the projectile
func shoot():
	var projectile = ProjectileScene.instantiate()
	# Set the position of the projectile (e.g., at the player's position)
	if is_flipped == true:
		projectile.position = animated_sprite_2d.global_position + Vector2(-16, -16)
	elif is_flipped == false:
		projectile.position = animated_sprite_2d.global_position + Vector2(16, -16)

	# Calculate the direction to shoot based on mouse position
	var mouse_position = get_global_mouse_position()
	var shoot_direction = (mouse_position - global_position).normalized()

	# Calculate the angle of the shoot direction
	var angle = atan2(shoot_direction.y, shoot_direction.x)

	# Set the direction of the projectile based on the angle
	projectile.set_direction_angle(angle)

	# Add the projectile to the scene
	get_tree().current_scene.add_child(projectile)

func melee_attack():
	if animated_sprite_2d.flip_h == true:
		animation_player.play("attack_left")
	elif animated_sprite_2d.flip_h == false:
		animation_player.play("attack")
	
