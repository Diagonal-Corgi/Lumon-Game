extends RigidBody2D
@onready var audio_stream_player = $Area2D/AudioStreamPlayer
@onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	animation_player.play("rotate_lumina")

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		Global.add_item(1, "lumina")
		animation_player.play("pickup")
