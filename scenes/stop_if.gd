extends MarginContainer

func _on_stop_if_is_over_pressed(is_checked: bool) -> void:
	Values.stop_if_is_over = is_checked

func _on_stop_if_is_less_pressed(is_checked: bool) -> void:
	Values.stop_if_is_less = is_checked

func _on_stop_if_is_over_value_changed(new_text: String) -> void:
	Values.stop_if_is_over_value = int(new_text)

func _on_stop_if_is_less_value_changed(new_text: String) -> void:
	Values.stop_if_is_less_value = int(new_text)
	print(Values.stop_if_is_less_value)
