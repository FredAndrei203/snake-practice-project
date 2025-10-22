class_name SnakePart extends CharacterBody2D

var snake_segment_scene: PackedScene = load("res://the_snake/snake_segment.tscn")
@onready var snake_part_design: CanvasGroup = %SnakePartDesign

var direction_input: Vector2 = Vector2.ZERO
var current_direction: Vector2 =Vector2.ZERO
var last_position: Vector2 = Vector2.ZERO
var last_direction: Vector2 = Vector2.ZERO
var scalar_speed: float = GameProper.distance_per_tile
var proceeding_part: SnakePart:
	set(new_part):
		proceeding_part = new_part
		proceeding_part.direction_input = direction_input
		proceeding_part.current_direction = direction_input

func move_part() -> void:
	current_direction = direction_input
	last_position = global_position
	last_direction = direction_input
	global_position += scalar_speed * current_direction
	var angle = current_direction.angle()
	%SnakePartDesign.rotation = angle

func order_proceeding_part() -> void:
	if proceeding_part == null:
		return
	proceeding_part.move_part()
	proceeding_part.order_proceeding_part()
	proceeding_part.direction_input = direction_input

func add_new_part() -> void:
	if proceeding_part != null:
		proceeding_part.add_new_part()
	else:
		var new_part: SnakeSegment = snake_segment_scene.instantiate()
		owner.add_child(new_part)
		new_part.owner = owner
		proceeding_part = new_part
		new_part.global_position = last_position
		new_part.direction_input = last_direction
		new_part.snake_part_design.rotation = last_direction.angle()
