class_name SnakeHeadV2 extends SnakeHead

signal ate_an_apple

var segment_scene: PackedScene = preload("res://the_snake/snake_segment.tscn")

var snake_segments: Array[SnakeSegment]

var apples_eaten: int = 0

func update_snake() -> void:
	move_part()
	if has_eaten_apple:
		apples_eaten += 1
		has_eaten_apple = false
		ate_an_apple.emit()
		create_new_snake_segment()
	else:
		move_snake_body()

func move_snake_body() -> void:
	var succeeding_part_dir: Vector2 = last_direction
	for segment in snake_segments:
		segment.move_part()
		segment.direction_input = succeeding_part_dir
		succeeding_part_dir = segment.last_direction

func create_new_snake_segment() -> void:
	var segment: SnakeSegment = segment_scene.instantiate()
	owner.add_child(segment)
	snake_segments.push_front(segment)
	segment.global_position = last_position
	segment.direction_input = last_direction
	segment.snake_part_design.rotation = last_direction.angle()

func reset_snake() -> void:
	snake_segments.clear()
	apples_eaten = 0
	has_died = false
	direction_input = Vector2.RIGHT
