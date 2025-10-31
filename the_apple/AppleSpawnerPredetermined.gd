class_name AppleSpawnerPredetermined extends AppleSpawner

var tile_pointer: int = 0

func place_apple_on_play_area(apple: Apple):
	var tile = g_tile_walkables[tile_pointer % 200]
	tile_pointer += 1
	apple.global_position = tile.global_position
