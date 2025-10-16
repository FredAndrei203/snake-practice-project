class_name GridTile extends Area2D

var is_occupied: bool = false

func _on_area_entered(area: Area2D) -> void:
	if !area is GridTile:
		is_occupied = true
		%Label.text = "O"


func _on_area_exited(area: Area2D) -> void:
	is_occupied = false
	%Label.text = "X"
