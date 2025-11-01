@tool
class_name ValueSetterUI extends BoxContainer

@export_multiline var label_text: String = "Place text here": set = _set_label
@export var min_value: float = 0: set = _set_min_value
@export var max_value: float = 100: set = _set_max_value
@export var step: float = 1: set = _set_step
@export var default_value: float = 0: set = _set_default_value
@export var spinbox_suffix: String = "": set = _set_spinbox_suffix

func _set_label(new_value: String) -> void:
	if !Engine.is_editor_hint():
		return
	label_text = new_value
	%Label.text = label_text

func _set_min_value(new_value: float) -> void:
	if !Engine.is_editor_hint():
		return
	min_value = new_value
	%SpinBox.min_value = new_value
	%HScrollBar.min_value = new_value
	default_value = default_value

func _set_max_value(new_value: float) -> void:
	if !Engine.is_editor_hint():
		return
	max_value = new_value
	%SpinBox.max_value = new_value
	%HScrollBar.max_value = new_value
	default_value = default_value

func _set_step(new_value: float) -> void:
	if !Engine.is_editor_hint():
		return
	step = new_value
	%SpinBox.step = new_value
	%HScrollBar.step = new_value

func _set_default_value(new_value: float) -> void:
	if !Engine.is_editor_hint():
		return
	default_value = clamp(new_value, min_value, max_value)
	%SpinBox.value = default_value
	%HScrollBar.value = default_value

func _set_spinbox_suffix(new_value: String) -> void:
	if !Engine.is_editor_hint():
		return
	spinbox_suffix = new_value
	%SpinBox.suffix = new_value
