extends Node


onready var game_over := $GameOver


func _on_Player_died() -> void:
	game_over.visible = true
