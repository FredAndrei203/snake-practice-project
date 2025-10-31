class_name GameProper extends Node2D

static var distance_per_tile: float = 51

@onready var apple_spawner: AppleSpawner = %AppleSpawner
@onready var snake_head: SnakeHeadV2 = %SnakeHeadV2

func _ready() -> void:
	#Set up play area
	%GridPlayArea.grid_size = Vector2(20, 10)
	%GridPlayArea.set_up_walkable_grid()
	%GridPlayArea.set_up_grid_walls()
	
	#Give apple spawner reference to the walkable tiles
	apple_spawner.g_tile_walkables = %GridPlayArea.g_tile_walkables
	
	#Initialize the snake
	initialize_snake()

func initialize_snake() -> void:
	snake_head.global_position = %GridPlayArea.get_center_tile().global_position - Vector2(distance_per_tile * 3, 0)
	for idx in range(2):
		snake_head.has_eaten_apple = true
		snake_head.update_snake()

func _on_interval_timer_timeout() -> void:
	snake_head.update_snake()
	apple_spawner.spawn_apples()


func _on_snake_head_snake_died() -> void:
	%IntervalTimer.stop()


func _on_snake_head_v_2_snake_died() -> void:
	%IntervalTimer.stop()
