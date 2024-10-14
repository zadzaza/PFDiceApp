extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%RangeTxtBox1.get_node("LineEdit").text_changed.connect(_on_range1_text_changed)
	%RangeTxtBox2.get_node("LineEdit").text_changed.connect(_on_range2_text_changed)
	
func _on_range1_text_changed(text: String):
	Events.range1_changed.emit(int(text))

func _on_range2_text_changed(text: String):
	Events.range2_changed.emit(int(text))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
