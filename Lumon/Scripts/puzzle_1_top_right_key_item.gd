extends RigidBody2D
@onready var audio_stream_player = $AudioStreamPlayer
@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("glow")
	
func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		Global.add_item(1, "puzzle_1_top_right_key")
		animation_player.play("pickup")
