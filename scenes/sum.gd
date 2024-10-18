extends MarginContainer

func _ready() -> void:
	format_value(Values.sum)
	
	Events.win.connect(_on_win)
	Events.defeat.connect(_on_defeat)
	
func _on_win(value: float):
	Values.sum += (Values.bet_value * Values.coeff_value) - Values.bet_value
	format_value(Values.sum)

func _on_defeat(value: float):
	Values.sum -= Values.bet_value
	format_value(Values.sum)

func format_value(value):
	var word := ""
	var str_value = str(abs(value))
	var i = 0
	for c in str_value.reverse():
		if i == 3:
			word = " " + word
			i = 0
		word = c + word
		i += 1
	
	%Label.text = str(word) + " сум"
