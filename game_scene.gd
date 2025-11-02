class_name GameScene extends Node

var game_proper_scene: PackedScene = preload("res://the_game_proper/game_proper.tscn")
var main_menu_scene: PackedScene = preload("res://the_menu/main_menu_ui.tscn")

@onready var main_menu: MainMenuUI = %MainMenuUI
var game_proper: GameProper

func _create_new_game(play_area_size: Vector2, tick_rate: float, apple_count: int) -> void:
	main_menu.enter_the_game
	main_menu.queue_free()
	var new_game: GameProper = game_proper_scene.instantiate()
	add_child(new_game)
	new_game._initialize_round(play_area_size, tick_rate, apple_count)
	game_proper = new_game
	game_proper.start_round()

func _create_menu() -> void:
	game_proper.queue_free()
	var new_menu: MainMenuUI = main_menu_scene.instantiate()
	add_child(new_menu)
	main_menu = new_menu
	main_menu.enter_the_game.connect(_on_main_menu_ui_enter_the_game)

func _on_main_menu_ui_enter_the_game(play_area_size: Vector2, tick_rate: float, apple_count: int) -> void:
	_create_new_game(play_area_size, tick_rate, apple_count)
