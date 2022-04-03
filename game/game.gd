extends Node


export var perfect_drop_count := 5

onready var game_over := $GameOver
onready var ceiling := $Ceiling


func _on_Player_died() -> void:
	ceiling.stop()
	
	game_over.visible = true
	if ceiling.drop_count == perfect_drop_count:
		game_over.set_score(ceiling.spawn_count, true)
	else:
		game_over.set_score(ceiling.spawn_count - 1, false)
