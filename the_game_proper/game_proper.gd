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
	snake_head.global_position = %GridPlayArea.get_center_tile().global_position
	%SnakeSegment.global_position = snake_head.global_position - Vector2(distance_per_tile, 0)
	%SnakeSegment2.global_position = %SnakeSegment.global_position - Vector2(distance_per_tile,0)
	snake_head.snake_segments.append(%SnakeSegment)
	snake_head.snake_segments.append(%SnakeSegment2)

func _on_interval_timer_timeout() -> void:
	snake_head.update_snake()
	apple_spawner.spawn_apples()


func _on_snake_head_snake_died() -> void:
	%IntervalTimer.stop()
