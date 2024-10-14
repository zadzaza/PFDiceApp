extends MarginContainer

var range1: int
var range2: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	calcul()
	
	Events.range1_changed.connect(_on_range1_changed)
	Events.range2_changed.connect(_on_range2_changed)

func calcul():
	Values.chance_value = abs(range1 - range2)
	if Values.chance_value > 0:
		Values.coeff_value = round((98.95 / Values.chance_value) * pow(10.0, 2)) / pow(10.0, 2)
	%ChanceValue.text = str(Values.chance_value) + "%"
	%CoeffValue.text = "%.2f" % Values.coeff_value

func _on_range1_changed(value: int):
	range1 = value
	calcul()

func _on_range2_changed(value: int):
	range2 = value
	calcul()
