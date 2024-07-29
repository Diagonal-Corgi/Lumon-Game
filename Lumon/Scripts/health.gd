extends RigidBody2D
@onready var audio_stream_player = $AudioStreamPlayer
@onready var animation_player = $AnimationPlayer

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		Global.add_health()
		animation_player.play("pickup")
