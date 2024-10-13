extends MarginContainer


func _on_min_pressed() -> void:
	Events.min_btn_pressed.emit()

func _on_2_pressed() -> void:
	Events._2_btn_pressed.emit()

func _on_x_2_pressed() -> void:
	Events.x_2_btn_pressed.emit()

func _on_max_pressed() -> void:
	Events.max_btn_pressed.emit()
