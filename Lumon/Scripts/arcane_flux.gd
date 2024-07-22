extends RigidBody2D

@onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.@onready var arcane_flux_label = %Arcane_Flux_Label

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation_player.play("rotate")


func _on_body_entered(body):
		Global.add_arcane_flux()
		queue_free()
