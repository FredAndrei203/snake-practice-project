class_name SnakePart extends CharacterBody2D

var direction_input: Vector2 = Vector2.ZERO
var current_direction: Vector2 =Vector2.ZERO
var scalar_speed: float = 50
var proceeding_part: SnakePart:
	set(new_part):
		proceeding_part = new_part
		proceeding_part.direction_input = direction_input
		proceeding_part.current_direction = direction_input

func move_part() -> void:
	current_direction = direction_input
	position += scalar_speed * current_direction
	var angle = current_direction.angle()
	%SnakePartDesign.rotation = angle

func order_proceeding_part() -> void:
	if proceeding_part == null:
		return
	proceeding_part.move_part()
	proceeding_part.order_proceeding_part()
	proceeding_part.direction_input = direction_input
