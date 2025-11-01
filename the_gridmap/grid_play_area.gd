class_name GridPlayArea extends Node2D

var grid_tile_walkable: PackedScene = preload("res://the_gridmap/grid_tile_walkable.tscn")
var grid_tile_wall: PackedScene = preload("res://the_gridmap/grid_tile_wall.tscn")

var g_tile_walkables: Array[GridTileWalkable]
var g_tile_walls: Array[GridTileWall]
var grid_size: Vector2

var tiles_occupied: int = 0

func set_up_walkable_grid() -> void:
	var tile_size: float = GameProper.distance_per_tile
	var starting_point: Vector2 = global_position - (grid_size * tile_size) / 2 + Vector2(tile_size, tile_size) / 2
	for y in range(grid_size.y):
		for x in range(grid_size.x):
			var new_tile: GridTileWalkable = grid_tile_walkable.instantiate()
			add_child(new_tile)
			new_tile.global_position = starting_point + Vector2(x, y) * tile_size
			g_tile_walkables.append(new_tile)
			new_tile.grid_container = self

func set_up_grid_walls() -> void:
	var tile_size: float = GameProper.distance_per_tile
	var wall_grid_size: Vector2 = grid_size + Vector2(2, 2)
	var starting_point: Vector2 = global_position - (wall_grid_size * tile_size) / 2 + Vector2(tile_size, tile_size) / 2
	for y in range(wall_grid_size.y):
		for x in range(wall_grid_size.x):
			if (y == 0 or y == wall_grid_size.y - 1) or (x == 0 or x == wall_grid_size.x - 1):
				var new_tile: GridTileWall = grid_tile_wall.instantiate()
				add_child(new_tile)
				new_tile.global_position = starting_point + Vector2(x, y) * tile_size
				g_tile_walls.append(new_tile)

func get_center_tile() -> GridTile:
	if g_tile_walkables.is_empty():
		return null

	var center_x := int(grid_size.x / 2)
	var center_y := int(grid_size.y / 2)
	var center_index := center_y * int(grid_size.x) + center_x

	return g_tile_walkables[center_index]
