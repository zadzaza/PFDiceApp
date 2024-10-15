extends MarginContainer

func _ready() -> void:
	%Label.text = str(Values.sum) + " сум"
	
	Events.win.connect(_on_win)
	Events.defeat.connect(_on_defeat)
	
func _on_win(value: float):
	Values.sum += (Values.bet_value * Values.coeff_value) - Values.bet_value
	%Label.text = str(Values.sum) + " сум"

func _on_defeat(value: float):
	Values.sum -= Values.bet_value
	%Label.text = str(Values.sum) + " сум"
