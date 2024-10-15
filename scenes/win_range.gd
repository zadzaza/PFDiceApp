extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%RangeTxtBox1.get_node("LineEdit").text_changed.connect(_on_range1_text_changed)
	%RangeTxtBox2.get_node("LineEdit").text_changed.connect(_on_range2_text_changed)
	
func _on_range1_text_changed(text: String):
	Values.range1_value = int(text)
	Events.range1_changed.emit(Values.range1_value)

func _on_range2_text_changed(text: String):
	Values.range2_value = int(text)
	Events.range2_changed.emit(Values.range2_value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
