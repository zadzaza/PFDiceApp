extends HBoxContainer

@onready var check_button: CheckBtn = $CheckBtn
@onready var percent_txt_box: MarginContainer = $PercentTxtBox

func _ready() -> void:
	check_button.check_btn_pressed.connect(_on_check_btn_pressed)

func _on_check_btn_pressed(is_pressed: bool) -> void:
	percent_txt_box.set_editable_line(is_pressed)
