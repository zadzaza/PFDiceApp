extends MarginContainer

func _on_if_win_not_change_pressed(is_checked: bool) -> void:
	Values.if_win_not_change = is_checked

func _on_if_win_return_base_bet(is_checked: bool) -> void:
	Values.if_win_return_base_bet = is_checked

func _on_if_win_increase(is_checked: bool) -> void:
	Values.if_win_increase = is_checked

func _on_if_win_decrease(is_checked: bool) -> void:
	Values.if_win_decrease = is_checked

func _on_if_win_value_increase_changed(new_text: String) -> void:
	Values.if_win_value_increase = int(new_text)

func _on_if_win_value_decrease_changed(new_text: String) -> void:
	Values.if_win_value_decrease = int(new_text)
