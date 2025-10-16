class_name GridPlayArea extends Node2D

var grid_tile_scene: PackedScene = preload("res://the_gridmap/grid_tile.tscn")

var grid_tiles: Array[GridTile]
var grid_size: Vector2

func set_up_grid() -> void:
	var tile_size: float = GameProper.distance_per_tile
	var starting_point: Vector2 = global_position - (grid_size * tile_size) / 2 + Vector2(tile_size, tile_size) / 2
	for y in range(grid_size.y):
		for x in range(grid_size.x):
			var new_tile: GridTile = grid_tile_scene.instantiate()
			add_child(new_tile)
			new_tile.global_position = starting_point + Vector2(x, y) * tile_size
			grid_tiles.append(new_tile)

func get_center_tile() -> GridTile:
	if grid_tiles.is_empty():
		return null

	var center_x := int(grid_size.x / 2)
	var center_y := int(grid_size.y / 2)
	var center_index := center_y * int(grid_size.x) + center_x

	return grid_tiles[center_index]
