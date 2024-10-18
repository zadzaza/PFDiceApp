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

var sum_autobet: int

func _ready() -> void:
	bet.connect(_on_bet)
	win.connect(_on_win)
	defeat.connect(_on_defeat)
	start_autobet.connect(_on_start_autobet)
	stop_autobet.connect(_on_stop_autobet)

#func _on_bet_value_updated(bet_value: int):
	#if Values.bet_value < Values.min_value or Values.bet_value >Values. max_value:
		#Values.bet_value = Values.min_value
	#
	#Values.bet_value = bet_value

func _on_bet():
	if Values.bet_value < Values.min_value:
		Values.bet_value = Values.min_value
	elif Values.bet_value > Values.max_value:
		Values.bet_value = Values.min_value

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
	
	bet_value_updated.emit(Values.bet_value)

	if Values.stop_if_is_over:
		if Values.sum > sum_autobet * (Values.stop_if_is_over_value / 100):
			stop_autobet.emit()
	if Values.stop_if_is_less:
		if Values.sum < sum_autobet * (Values.stop_if_is_less_value / 100):
			stop_autobet.emit()
	
func _on_win(value: float):
	if Values.autobet_active:
		if Values.if_win_not_change:
			return
		elif Values.if_win_return_base_bet:
			Values.bet_value = 10000
		elif Values.if_win_increase:
			Values.bet_value += Values.bet_value * (Values.if_win_value_increase / 100)
		elif Values.if_win_decrease:
			Values.bet_value -= Values.bet_value * (Values.if_win_value_decrease / 100)
			
	bet_value_updated.emit(Values.bet_value)
		
func _on_defeat(value: float):
	if Values.autobet_active:
		if Values.if_def_not_change:
			return
		elif Values.if_def_return_base_bet:
			Values.bet_value = 10000
		elif Values.if_def_increase:
			Values.bet_value += Values.bet_value * (Values.if_def_value_increase / 100)
		elif Values.if_win_decrease:
			Values.bet_value -= Values.bet_value * (Values.if_def_value_decrease / 100)
	
	bet_value_updated.emit(Values.bet_value)
	
func _on_start_autobet():
	sum_autobet = Values.sum
	Values.autobet_active = true

func _on_stop_autobet():
	Values.autobet_active = false
