extends MarginContainer


func _on_history_btn_pressed() -> void:
	Events.history_btn_pressed.emit()
