extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%LineEdit.text = str(Values.throw_count)

func _on_line_edit_text_changed(new_text: String) -> void:
	Values.throw_count = int(%LineEdit.text)
	print(Values.throw_count)
