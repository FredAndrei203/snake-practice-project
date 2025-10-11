class_name GridPlayArea extends Node2D

var grid_tile_scene: PackedScene = preload("res://the_gridmap/grid_tile.tscn")

var grid_tiles: Array[GridTile]

func set_up_grid(row_size: int, column_size: int) -> void:
	var grid_size: Vector2 = Vector2(row_size, column_size)
	var tile_size: float = 50
	var starting_point: Vector2 = global_position - (grid_size * tile_size) / 2 + Vector2(tile_size, tile_size) / 2
	print("Center position: ", global_position)
	print("Top left position: ", starting_point)
	for y in range(grid_size.y):
		for x in range(grid_size.x):
			var new_tile: GridTile = grid_tile_scene.instantiate()
			add_child(new_tile)
			new_tile.global_position = starting_point + Vector2(x, y) * tile_size
			grid_tiles.append(new_tile)
	print("Position of first tile: ", grid_tiles[0].global_position)
