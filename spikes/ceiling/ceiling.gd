class_name Ceiling
extends Node2D


export(PackedScene) var spike_scene
export var drop_distance := 16.0
export var drop_duration := 1.0
export var drop_delay := 1.0

var spike_count := 0

onready var spawn_timer := $SpawnTimer
onready var spikes := $Spikes
onready var tween := $Tween


func _ready() -> void:
	spike_count = spikes.get_child_count()


func _spawn_spikes() -> void:
	var empty_index := randi() % spike_count
	
	for i in spike_count:
		if not i == empty_index:
			var spike = spike_scene.instance()
			add_child(spike)
			spike.gravity_enabled = true
			spike.position = spikes.get_child(i).position


func _start_tween() -> void:
	var target = position
	target.y += drop_distance
	tween.interpolate_property(self, "position", position, target, drop_duration,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, drop_delay)
	tween.start()


func _on_SpawnTimer_timeout() -> void:
	_spawn_spikes()
	_start_tween()


func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	spawn_timer.start()
