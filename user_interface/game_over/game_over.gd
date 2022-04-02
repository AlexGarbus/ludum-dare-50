class_name GameOver
extends Control


func _on_RetryButton_button_up() -> void:
	get_tree().reload_current_scene()
