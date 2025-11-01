class_name GameScene extends Node


func _on_main_menu_ui_enter_the_game(play_area_size: Vector2, tick_rate: float, apple_count: int) -> void:
	var new_game: GameProper = GameProper.new(play_area_size, tick_rate, apple_count)
