extends KinematicBody2D


export var move_speed := 1.0


func _physics_process(delta: float) -> void:
	move_and_slide(_get_move_direction() * move_speed)


func _get_move_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0)
