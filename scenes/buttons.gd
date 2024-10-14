extends MarginContainer

func _on_min_pressed() -> void:
	Events.bet_value_updated.emit(Values.min_value)

func _on_2_pressed() -> void:
	Events.bet_value_updated.emit(Values.bet_value * 2)

func _on_x_2_pressed() -> void:
	Events.bet_value_updated.emit(Values.bet_value / 2)

func _on_max_pressed() -> void:
	Events.bet_value_updated.emit(Values.max_value)
