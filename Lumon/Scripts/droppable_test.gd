extends Node2D
@onready var puzzle_1_bottom_right_key = $puzzle_1_bottom_right_key
@onready var puzzle_1_bottom_left_key = $puzzle_1_bottom_left_key
@onready var puzzle_1_top_right_key = $puzzle_1_top_right_key
@onready var puzzle_1_top_left_key = $puzzle_1_top_left_key
@onready var animation_player = $AnimationPlayer
@onready var puzzle_1 = $Puzzle1

var solved = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	puzzle_solved()

func puzzle_solved():
	if solved == false and puzzle_1_bottom_left_key.is_in_correct_position and puzzle_1_bottom_right_key.is_in_correct_position and puzzle_1_top_left_key.is_in_correct_position and puzzle_1_bottom_right_key.is_in_correct_position:
		animation_player.play("correct")
		solved = true
