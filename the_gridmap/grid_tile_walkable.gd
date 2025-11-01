class_name GridTileWalkable extends GridTile

var grid_container: GridPlayArea
var is_occupied: bool = false

func _process(delta: float) -> void:
	var previous_state: bool = is_occupied
	if has_overlapping_areas():
		is_occupied = true
	else:
		is_occupied = false
	if previous_state != is_occupied and is_occupied:
		grid_container.tiles_occupied += 1
	elif previous_state != is_occupied and !is_occupied:
		grid_container.tiles_occupied -= 1
