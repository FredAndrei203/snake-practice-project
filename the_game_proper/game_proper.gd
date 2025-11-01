class_name GameProper extends Node2D

static var distance_per_tile: float = 51

@onready var apple_spawner: AppleSpawner = %AppleSpawner
@onready var snake_head: SnakeHeadV2 = %SnakeHeadV2

func _initialize_round(grid_size: Vector2, tick_rate: float, apple_count: int) -> void:
	%IntervalTimer.wait_time = 1 / tick_rate
	%AppleSpawner.max_apple_existing = apple_count
	%AppleSpawner.grid_play_area = %GridPlayArea
	%GridPlayArea.grid_size = grid_size
	%GridPlayArea.set_up_walkable_grid()
	%GridPlayArea.set_up_grid_walls()
	%PlayState.snake = %SnakeHeadV2
	%PlayState.target_apples_eaten = %GridPlayArea.g_tile_walkables.size() - 1
	#Give apple spawner reference to the walkable tiles
	apple_spawner.g_tile_walkables = %GridPlayArea.g_tile_walkables
	#Initialize the snake
	initialize_snake()

func initialize_snake() -> void:
	snake_head.global_position = %GridPlayArea.get_center_tile().global_position - Vector2(distance_per_tile * 3, 0)
	for idx in range(2):
		snake_head.has_eaten_apple = true
		snake_head.update_snake()

func start_round() -> void:
	%IntervalTimer.start()

func reset_round() -> void:
	snake_head.reset_snake()
	get_tree().call_group("snake_segments", "queue_free")
	get_tree().call_group("apples", "queue_free")
	initialize_snake()
	%RoundEndUI.hide()
	%AppleSpawner.reset_spawner()
	start_round()

func _on_interval_timer_timeout() -> void:
	snake_head.update_snake()
	apple_spawner.spawn_apples()


func _on_snake_head_v_2_snake_died() -> void:
	%PlayState.check_conditions()


func _on_snake_head_v_2_ate_an_apple() -> void:
	%PlayState.check_conditions()


func _on_play_state_player_lost() -> void:
	%IntervalTimer.stop()
	%RoundEndUI.show()
	%RoundEndUI.message = "Player Lost..."


func _on_play_state_player_won() -> void:
	%IntervalTimer.stop()
	%RoundEndUI.show()
	%RoundEndUI.message = "Player Won!"


func _on_round_end_ui_exit_game_proper() -> void:
	pass # Replace with function body.


func _on_round_end_ui_play_again() -> void:
	reset_round()
