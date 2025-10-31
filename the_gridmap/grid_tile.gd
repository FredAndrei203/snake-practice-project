class_name GridTile extends Area2D

var is_occupied: bool = false

func _on_area_entered(area: Area2D) -> void:
	is_occupied = true
	_action_when_entered_by(area)


func _on_area_exited(area: Area2D) -> void:
	is_occupied = false
	_action_when_exited_by(area)

func _action_when_entered_by(area: Area2D) -> void:
	pass

func _action_when_exited_by(area: Area2D) -> void:
	pass
