extends MarginContainer

@export var value: int

func _ready() -> void:
	set_value(100000)

func set_value(value: int):
	self.value = value
	$MarginContainer/Label.text = str(self.value) + " сум"
