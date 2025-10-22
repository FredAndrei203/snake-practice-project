class_name AppleSpawner extends Node

var apple_scene: PackedScene = preload("res://the_apple/apple.tscn")

var max_apple_existing = 3
var existing_apples: Array[Apple]

var g_tile_walkables: Array[GridTileWalkable]

func spawn_apples() -> void:
	if existing_apples.size() >= max_apple_existing:
		return
	var new_apple: Apple = apple_scene.instantiate()
	new_apple.apple_spawner = self
	place_apple_randomly(new_apple)
	existing_apples.append(new_apple)
	owner.add_child(new_apple)

func place_apple_randomly(apple: Apple):
	while(true):
		var tile = g_tile_walkables.pick_random()
		if !tile.is_occupied:
			apple.global_position = tile.global_position
			return


func _on_game_proper_post_interval() -> void:
	spawn_apples()
