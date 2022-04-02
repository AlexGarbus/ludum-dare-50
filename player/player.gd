class_name Player
extends KinematicBody2D


export var move_speed := 1.0

onready var sprite := $AnimatedSprite


func _physics_process(delta: float) -> void:
	var direction = _get_move_direction()
	
	move_and_slide(direction * move_speed)

	var animation = _get_animation(direction)
	if not sprite.animation == animation:
		sprite.play(animation)


func _get_move_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0)


func _get_animation(direction: Vector2) -> String:
	if not direction.x == 0:
		return "move"
	return "idle"
