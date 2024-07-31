extends CharacterBody2D

@export var speed = 100
@export var drog_health = 1

@onready var player = $"../Player"
@onready var animation_player = $AnimationPlayer
@onready var player_hurt = $player_hurt
@onready var audio_stream_player = $AudioStreamPlayer

const lumina = preload("res://Scenes/lumina_new.tscn")
const shadonite = preload("res://Scenes/shadonite_new.tscn")
const arcane_flux = preload("res://Scenes/arcane_flux_new.tscn")

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
		Global.remove_health()
		player_hurt.play()
	elif area.is_in_group("player_melee_attack"):
		audio_stream_player.play()
		take_damage()
	elif area.is_in_group("player_projectile_attack"):
		audio_stream_player.play()
		take_damage()
	
func drop_loot():
	var num_lumina_to_drop = randi() % 3 + 1
	var num_arcane_to_drop = randi() % 2 + 1
	
	for i in range(num_lumina_to_drop):
		var lumina_instance = lumina.instantiate()
		# Offset the loot position slightly for each item so they don't stack exactly
		var offset = Vector2(randi() % 21 - 10, randi() % 60 - 30)  # Random x offset between -10 and 10
		lumina_instance.position = self.position + offset
		get_tree().current_scene.call_deferred("add_child", lumina_instance)
		
	for i in range(num_arcane_to_drop):
		var arcane_instance = arcane_flux.instantiate()
		# Offset the loot position slightly for each item so they don't stack exactly
		var offset = Vector2(randi() % 21 - 10, randi() % 60 - 30)  # Random x offset between -10 and 10
		arcane_instance.position = self.position + offset
		get_tree().current_scene.call_deferred("add_child", arcane_instance)

func take_damage():
	if drog_health > 0:
		animation_player.play("damage_taken")
		drog_health -= 1
	elif drog_health == 0:
		drop_loot()	
		queue_free()

