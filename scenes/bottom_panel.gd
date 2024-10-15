extends MarginContainer


func _on_activate_btn_pressed() -> void:
	Events.activate_btn_pressed.emit()

func _on_bet_pressed() -> void:
	if (Values.sum - Values.bet_value) >= 0:
		var picked_value = randf_range(0.00, 99.00)
		var max_value = max(Values.range1_value, Values.range2_value)
		var min_value = min(Values.range1_value, Values.range2_value)
		
		if picked_value > min_value and picked_value < max_value:
			Events.win.emit(picked_value)
		else:
			Events.defeat.emit(picked_value)
