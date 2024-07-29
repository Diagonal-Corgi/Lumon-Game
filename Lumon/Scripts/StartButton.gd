extends Button
@onready var audio_stream_player = $AudioStreamPlayer


func _on_pressed():
	audio_stream_player.play()
	get_tree().change_scene_to_file("res://Scenes/onboarding.tscn")

