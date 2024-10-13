extends MarginContainer

func _ready() -> void:
	Events.bet_btn_pressed.connect(_on_bet_btn_pressed)

func _on_bet_btn_pressed():
	if Values.bet_value < 10000:
		Values.bet_value = 10000
	elif Values.bet_value > 3000000:
		Values.bet_value = 3000000
	%LineEdit.text = str(Values.bet_value)

func _on_line_edit_text_changed(new_text: String) -> void:
	Values.bet_value = int(new_text)
