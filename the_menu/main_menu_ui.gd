class_name MainMenuUI extends Control

signal enter_the_game(play_area_size: Vector2, tick_rate: float, apple_count: int)

@onready var current_state: Control = %MenuInitialStateUI

func _switch_state(new_state: Control) -> void:
	current_state.hide()
	current_state = new_state
	current_state.show()

func _on_menu_initial_state_ui_player_wants_to_play() -> void:
	_switch_state(%GameInitializationStateUI)


func _on_game_initialization_state_ui_relay_level_init(size: Vector2, speed: float, apples: int) -> void:
	enter_the_game.emit(size, speed, apples)
