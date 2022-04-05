class_name Player
extends Area2D


signal died

export var move_duration := 0.1

var _dead := false
var _moving := false
var _wall_detector_cast_length := 0.0

onready var death_sound := $DeathSound
onready var sprite := $AnimatedSprite
onready var tween := $Tween
onready var wall_detector := $WallDetector


func _ready() -> void:
	_wall_detector_cast_length = wall_detector.cast_to.length()


func _process(delta: float) -> void:
	if _moving:
		return
	
	var direction = _get_move_direction()
	
	if not direction == Vector2.ZERO:
		wall_detector.cast_to = direction * _wall_detector_cast_length
		if not wall_detector.is_colliding():
			_start_tween(position + wall_detector.cast_to)

	var animation = _get_animation(direction)
	if not sprite.animation == animation:
		sprite.play(animation)


func _get_move_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0)


func _get_animation(direction: Vector2) -> String:
	if not direction.x == 0:
		return "move"
	return "idle"
	

func _start_tween(target: Vector2) -> void:
	tween.interpolate_property(self, "position", position, target, move_duration)
	tween.start()
	_moving = true


func _on_Player_body_entered(body: Node) -> void:
	if _dead:
		return

	set_process(false)
	set_physics_process(false)
	
	death_sound.play()
	
	_dead = true
	emit_signal("died")


func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	_moving = false
