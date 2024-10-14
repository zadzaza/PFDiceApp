extends MarginContainer


func _on_activate_btn_pressed() -> void:
	Events.activate_btn_pressed.emit()

func _on_bet_pressed() -> void:
	Events.bet_btn_pressed.emit(randf_range(0.00, 99.00))
