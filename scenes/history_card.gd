extends MarginContainer

@onready var id_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/IdLbl
@onready var number_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/NumberLbl
@onready var date_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer/HBoxContainer/DateLbl
@onready var range_min_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer2/HBoxContainer/HBoxContainer/RangeMinLbl
@onready var range_max_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer2/HBoxContainer/HBoxContainer/RangeMaxLbl
@onready var coeff_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer2/HBoxContainer3/CoeffLbl
@onready var vybrosil_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer2/HBoxContainer4/VybrosilLbl
@onready var bet_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer3/PanelContainer/VBoxContainer/BetLbl
@onready var result_lbl: Label = $MarginContainer/VBoxContainer/HBoxContainer3/PanelColored/VBoxContainer/ResultLbl
@onready var label: Label = $MarginContainer/VBoxContainer/HBoxContainer3/PanelColored/VBoxContainer/Label
@onready var panel_colored: PanelContainer = $MarginContainer/VBoxContainer/HBoxContainer3/PanelColored

var colors: Dictionary = {
	"green": [Color(0.89, 0.969, 0.898), Color(0.294, 0.533, 0.298)], # Цвет фона, цвет текста
	"red": [Color(0.969, 0.89, 0.894), Color(0.737, 0.384, 0.427)]
}

func _ready() -> void:
	set_card(1314523, "21.12.4224", "9270627974", 30, 90, 1.23, 20.43, 145, -254524)

func set_card(id: int, date: String, number: String, range_min: int, range_max: int, coeff: float, vybrosil: float, bet: int, result: int) -> void:
	id_lbl.text = str(id)
	number_lbl.text = number.substr(0, 3) + "***" + number.substr(number.length() - 3, 3)
	date_lbl.text = date
	range_min_lbl.text = str(range_min)
	range_max_lbl.text = str(range_max)
	coeff_lbl.text = str(round(coeff * pow(10.0, 2)) / pow(10.0, 2))
	vybrosil_lbl.text = str(round(vybrosil * pow(10.0, 2)) / pow(10.0, 2))
	bet_lbl.text = str(bet)
	
	var word := ""
	var i = 0
	var j = 0
	for c in str(result).reverse():
		if i == 3 and j != str(result).length() - 1:
			word = " " + word
			i = 0
		word = c + word
		i += 1
		j += 1

	if result >= 0:
		result_lbl.text = "+" + word
		panel_colored.modulate = colors["green"][0]
		result_lbl.modulate = colors["green"][1]
		label.modulate = colors["green"][1]
	else:
		result_lbl.text = word
		panel_colored.modulate = colors["red"][0]
		result_lbl.modulate = colors["red"][1]
		label.modulate = colors["red"][1]
		
		
