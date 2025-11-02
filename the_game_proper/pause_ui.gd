class_name PauseUI extends Control

signal cancel_current_session
signal pause_game
signal continue_game
signal restart_game

## If player can pause
var disabled: bool = false
var paused: bool = false:
	set(new_state):
		paused = new_state
		if paused:
			show()
			pause_game.emit()
		else:
			hide()
			continue_game.emit()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_cancel"):
			paused = !paused

func _on_continue_button_pressed() -> void:
	paused = false


func _on_exit_button_pressed() -> void:
	cancel_current_session.emit()


func _on_restart_button_pressed() -> void:
	restart_game.emit()
	paused = false
