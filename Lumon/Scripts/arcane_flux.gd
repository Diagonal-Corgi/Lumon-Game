extends RigidBody2D

@onready var animation_player = $AnimationPlayer
@onready var audio_stream_player = $Area2D/AudioStreamPlayer

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	animation_player.play("rotate")

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		Global.add_item(1, "arcane_flux")
		audio_stream_player.play()
		queue_free()
