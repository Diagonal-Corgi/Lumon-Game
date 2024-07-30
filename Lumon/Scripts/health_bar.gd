extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var health = Global.health
	if health == 5:
		$Health5.visible = true
	elif health == 4:
		$Health5.visible = false
		$Health4.visible = true
	elif health == 3:
		$Health5.visible = false
		$Health4.visible = false
		$Health3.visible = true
	elif health == 2:
		$Health5.visible = false
		$Health4.visible = false
		$Health3.visible = false
		$Health2.visible = true
	elif health == 1:
		$Health5.visible = false
		$Health4.visible = false
		$Health3.visible = false
		$Health2.visible = false
		$Health1.visible = true
