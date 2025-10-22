class_name GameProper extends Node2D

signal new_interval
signal post_interval
static var distance_per_tile: float = 51

func _ready() -> void:
	%GridPlayArea.grid_size = Vector2(20, 10)
	%GridPlayArea.set_up_walkable_grid()
	%GridPlayArea.set_up_grid_walls()
	
	%AppleSpawner.g_tile_walkables = %GridPlayArea.g_tile_walkables
	
	%SnakeHead.global_position = %GridPlayArea.get_center_tile().global_position
	%SnakeSegment.global_position = %SnakeHead.global_position - Vector2(distance_per_tile, 0)
	%SnakeSegment2.global_position = %SnakeSegment.global_position - Vector2(distance_per_tile,0)
	%SnakeHead.proceeding_part = %SnakeSegment
	%SnakeSegment.proceeding_part = %SnakeSegment2


func _on_interval_timer_timeout() -> void:
	new_interval.emit()
	post_interval.emit()


func _on_snake_head_snake_died() -> void:
	%IntervalTimer.stop()
