class_name RoundEndUI extends Control

signal play_again
signal exit_game_proper

var message: String:
	set(new_value):
		message = new_value
		%Label.text = message


func _on_play_again_button_pressed() -> void:
	play_again.emit()


func _on_menu_button_pressed() -> void:
	exit_game_proper.emit()
