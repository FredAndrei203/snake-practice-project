## Tracks data for winning and losing conditions.
class_name PlayState extends Node

signal player_won
signal player_lost

var target_apples_eaten: int
var snake: SnakeHeadV2

func check_conditions() -> void:
	if snake.has_died:
		player_lost.emit()
	elif snake.apples_eaten >= target_apples_eaten:
		player_won.emit()
