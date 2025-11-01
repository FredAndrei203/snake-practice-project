class_name GameInitializationStateUI extends Control

signal relay_level_init(size: Vector2, speed: float, apples: int)

@onready var play_area_init_ui: PlayAreaInitUI = %PlayAreaInitUI
@onready var game_speed_init_ui: ValueSetterUI = %GameSpeedInitUI
@onready var apple_init_ui: ValueSetterUI = %AppleInitUI

func start_game() -> void:
	var play_area_size: Vector2 = play_area_init_ui.get_player_choice()
	var tick_rate: float = game_speed_init_ui.obtain_value()
	var apple_count: int = int(apple_init_ui.obtain_value())
	relay_level_init.emit(play_area_size, tick_rate, apple_count)

func _on_play_area_init_ui_has_selected_area_size() -> void:
	%StartButton.disabled = false


func _on_start_button_pressed() -> void:
	start_game()
