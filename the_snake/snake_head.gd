class_name SnakeHead extends SnakePart

func _ready() -> void:
	direction_input = Vector2.RIGHT
	current_direction = Vector2.RIGHT

func _process(delta: float) -> void:
	_record_last_input()

func _record_last_input() -> void:
	var latest_input: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up","ui_down")
		).normalized()
	
	var cardinal: bool = is_cardinal_direction(latest_input)
	
	if latest_input == Vector2.ZERO or latest_input == current_direction * -1 or !cardinal:
		return
	direction_input = latest_input


func _on_game_proper_new_interval() -> void:
	move_part()
	order_proceeding_part()

func is_cardinal_direction(input: Vector2) -> bool:
	return input == Vector2.UP or input == Vector2.DOWN or input == Vector2.LEFT or input == Vector2.RIGHT
