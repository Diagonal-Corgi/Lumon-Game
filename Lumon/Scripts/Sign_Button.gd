extends Button
@onready var audio_stream_player = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pressed():
	audio_stream_player.play()
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
