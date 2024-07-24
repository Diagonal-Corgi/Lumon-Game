extends RigidBody2D

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		Global.add_health()
		queue_free()
