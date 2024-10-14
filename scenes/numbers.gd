extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.bet_btn_pressed.connect(_on_bet_btn_pressed)

func _on_bet_btn_pressed(value: float):
	print(str("%.2f" % 99.00))
