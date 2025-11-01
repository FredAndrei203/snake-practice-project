class_name PlayAreaInitUI extends BoxContainer

signal has_selected_area_size

@onready var choices: ItemList = %PlayAreaSizeList
var selected_item:  = -1

func get_player_choice() -> Vector2:
	var item_text: String = choices.get_item_text(selected_item)
	match item_text:
		"6 by 4":
			return Vector2(6, 4)
		"10 by 5":
			return Vector2(10, 5)
		"20 by 10":
			return Vector2(20, 10)
	return Vector2.ZERO


func _on_play_area_size_list_item_selected(index: int) -> void:
	selected_item = index
	has_selected_area_size.emit()
