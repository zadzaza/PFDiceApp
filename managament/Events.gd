extends Node

signal history_btn_pressed
signal activate_btn_pressed
signal bet
signal win(value: float)
signal defeat(value: float)
signal range1_changed(value: int)
signal range2_changed(value: int)
signal bet_value_updated(bet_value: int)
signal start_autobet
signal stop_autobet

func _ready() -> void:
	bet.connect(_on_bet)

func _on_bet():
	bet_value_updated.emit(Values.bet_value)
	if (Values.sum - Values.bet_value) >= 0:
		var picked_value = randf_range(0.00, 99.00)
		var max_value = max(Values.range1_value, Values.range2_value)
		var min_value = min(Values.range1_value, Values.range2_value)
		
		if picked_value > min_value and picked_value < max_value:
			win.emit(picked_value)
		else:
			defeat.emit(picked_value)
	else:
		stop_autobet.emit()
	print(Values.chance_value)
