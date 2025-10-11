class_name GameProper extends Node2D

signal new_interval

func _ready() -> void:
	%GridPlayArea.grid_size = Vector2(20, 10)
	%GridPlayArea.set_up_grid()
	%SnakeHead.global_position = %GridPlayArea.get_center_tile().global_position
	%SnakeSegment.global_position = %SnakeHead.global_position - Vector2(50, 0)
	%SnakeSegment2.global_position = %SnakeSegment.global_position - Vector2(50,0)
	%SnakeHead.proceeding_part = %SnakeSegment
	%SnakeSegment.proceeding_part = %SnakeSegment2


func _on_interval_timer_timeout() -> void:
	new_interval.emit()
