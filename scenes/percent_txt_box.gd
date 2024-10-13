extends MarginContainer

func _ready() -> void:
	set_editable_line(false)

func set_editable_line(is_editable: bool):
	var tween = create_tween()
	$ColorRect.visible = !is_editable
	if is_editable:
		tween.tween_property($LineEdit, "modulate", Color(1, 1, 1), 0.2).from_current()
	else:
		tween.tween_property($LineEdit, "modulate", Color(1, 1, 1, 0.439), 0.2).from_current()
