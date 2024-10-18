extends MarginContainer


func _on_if_def_not_change_pressed(is_checked: bool) -> void:
	Values.if_def_not_change = is_checked

func _on_if_def_return_base_bet_pressed(is_checked: bool) -> void:
	Values.if_def_return_base_bet = is_checked

func _on_if_def_increase_pressed(is_checked: bool) -> void:
	Values.if_def_increase = is_checked

func _on_if_def_decrease_pressed(is_checked: bool) -> void:
	Values.if_def_decrease = is_checked

func _on_if_def_value_increase_changed(new_text: String) -> void:
	Values.if_def_value_increase = int(new_text)

func _on_if_def_value_decrease_changed(new_text: String) -> void:
	Values.if_def_value_decrease = int(new_text)
