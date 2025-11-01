class_name AppleSpawner extends Node

var apple_scene: PackedScene = preload("res://the_apple/apple.tscn")

var max_apple_existing = 3
var apple_count: int = 0

var g_tile_walkables: Array[GridTileWalkable]
var grid_play_area: GridPlayArea

func reset_spawner() -> void:
	apple_count = 0

func spawn_apples() -> void:
	if apple_count >= max_apple_existing or grid_play_area.tiles_occupied >= g_tile_walkables.size():
		return
	var new_apple: Apple = apple_scene.instantiate()
	new_apple.apple_spawner = self
	place_apple_on_play_area(new_apple)
	apple_count += 1
	owner.add_child(new_apple)

func place_apple_on_play_area(apple: Apple):
	while(true):
		var tile = g_tile_walkables.pick_random()
		if !tile.is_occupied:
			apple.global_position = tile.global_position
			return
