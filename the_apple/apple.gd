class_name Apple extends Area2D

var apple_spawner: AppleSpawner

func _on_area_entered(area: Area2D) -> void:
	if area is SnakeHitbox:
		apple_spawner.apple_count -= 1
		queue_free()
