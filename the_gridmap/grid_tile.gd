class_name GridTile extends Area2D

var is_occupied: bool = false

func _on_area_entered(_area: Area2D) -> void:
	is_occupied = true


func _on_area_exited(_area: Area2D) -> void:
	is_occupied = false
