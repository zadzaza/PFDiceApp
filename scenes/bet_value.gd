extends MarginContainer

var min_value = Values.min_value
var max_value = Values.max_value

func _ready() -> void:
	%LineEdit.text = str(Values.min_value)
	Events.bet_btn_pressed.connect(_on_bet_btn_pressed)
	Events.bet_value_updated.connect(_on_bet_updated)

func _on_bet_updated(bet_value: int):
	if bet_value < min_value:
		bet_value = min_value
	elif bet_value > max_value:
		bet_value = max_value
	
	Values.bet_value = bet_value
	%LineEdit.text = str(Values.bet_value)

func _on_bet_btn_pressed():
	if Values.bet_value < min_value:
		Values.bet_value = min_value
	elif Values.bet_value > max_value:
		Values.bet_value = max_value
	%LineEdit.text = str(Values.bet_value)

func _on_line_edit_text_changed(new_text: String) -> void:
	Values.bet_value = int(new_text)
