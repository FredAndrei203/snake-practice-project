class_name MainMenuUI extends Control

@onready var current_state: Control = %MenuInitialStateUI

func _switch_state(new_state: Control) -> void:
	current_state.hide()
	current_state = new_state
	current_state.show()

func _on_menu_initial_state_ui_player_wants_to_play() -> void:
	_switch_state(%GameInitializationStateUI)
