class_name GameOver
extends Control


onready var message := $Message
onready var score := $Score
onready var retry_button := $RetryButton


func initialize_focus() -> void:
	retry_button.grab_focus()
	

func set_score(points: int, perfect := false) -> void:
	if perfect:
		message.text = "You were\nperfect!"
	score.text = score.text % points


func _on_RetryButton_button_up() -> void:
	get_tree().reload_current_scene()
