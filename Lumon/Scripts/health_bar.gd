extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var health = Global.health
	if health == 5:
		$Health5.visible = true
		$Empty5.visible = false
	elif health == 4:
		$Empty5.visible = true
		$Health5.visible = false
		$Empty4.visible = false
		$Health4.visible = true
	elif health == 3:
		$Empty4.visible = true
		$Health3.visible = false
		$Empty3.visible = false
		$Health3.visible = true
	elif health == 2:
		$Empty3.visible = true
		$Health3.visible = false
		$Empty2.visible = false
		$Health2.visible = true
	elif health == 1:
		$Empty2.visible = true
		$Health2.visible = false
		$Empty1.visible = false
		$Health1.visible = true
