extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPos: Vector2
var is_in_correct_position = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed('click'):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(5, 5)


func _on_area_2d_mouse_exited():
		if not Global.is_dragging:
			draggable = false
			scale = Vector2(4, 4)


func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group('puzzle_1_bottom_left'):
			is_inside_droppable = true
			body.modulate = Color(Color.GREEN_YELLOW, 1)
			body_ref = body
			is_in_correct_position = true


func _on_area_2d_body_exited(body):
	if body.is_in_group('puzzle_1_bottom_left'):
			is_inside_droppable = false
			body.modulate = Color(Color.DARK_SLATE_GRAY, 0.7)
