extends MarginContainer
class_name PercentTxtBox

signal percent_txt_box_changed(new_text: String)

@onready var line_edit: LineEdit = $LineEdit

@export var is_editable: bool = false

func _ready() -> void:
	set_editable_line(false)

func set_editable_line(is_editable: bool):
	var tween = create_tween()
	self.is_editable = is_editable
	#line_edit.text = ""
	#percent_txt_box_changed.emit(line_edit.text)
	$ColorRect.visible = !is_editable
	if is_editable:
		tween.tween_property(line_edit, "modulate", Color(1, 1, 1), 0.2).from_current()
	else:
		tween.tween_property(line_edit, "modulate", Color(1, 1, 1, 0.439), 0.2).from_current()

func _on_line_edit_text_changed(new_text: String) -> void:
	percent_txt_box_changed.emit(new_text)
