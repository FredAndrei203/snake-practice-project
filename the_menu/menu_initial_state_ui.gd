class_name MenuInitialStateUI extends Control

signal player_wants_to_play

func _on_play_button_pressed() -> void:
	player_wants_to_play.emit()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
