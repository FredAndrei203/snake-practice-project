class_name GridTileWalkable extends GridTile

enum OccupiedBy {NONE, SNAKE_PART, APPLE}
var occupied_by: OccupiedBy = OccupiedBy.NONE
var grid_container: GridPlayArea

func _action_when_entered_by(area: Area2D) -> void:
	if area is Apple:
		occupied_by = OccupiedBy.APPLE
	elif area is SnakeHitbox:
		occupied_by = OccupiedBy.SNAKE_PART
	grid_container.tiles_occupied += 1

func _action_when_exited_by(area: Area2D) -> void:
	occupied_by = OccupiedBy.NONE
	grid_container.tiles_occupied -= 1
