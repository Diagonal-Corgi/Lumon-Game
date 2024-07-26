extends RigidBody2D

@onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.@onready var arcane_flux_label = %Arcane_Flux_Label

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	animation_player.play("rotate")

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		Global.add_item(1, "arcane_flux")
		queue_free()
