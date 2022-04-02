extends KinematicBody2D


onready var gravity: float = ProjectSettings.get("physics/2d/default_gravity")

var _velocity = Vector2.ZERO


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	move_and_slide(_velocity)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
