extends MarginContainer

@onready var range_txt_box1: LineEdit = %RangeTxtBox1.get_node("LineEdit")
@onready var range_txt_box2: LineEdit = %RangeTxtBox2.get_node("LineEdit")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	range_txt_box1.text = str(Values.range1_value)
	range_txt_box2.text = str(Values.range2_value)
	
	range_txt_box1.text_changed.connect(_on_range1_text_changed)
	range_txt_box2.text_changed.connect(_on_range2_text_changed)
	connect_signals()

func set_range_editable(editable: bool) -> void:
	%RangeTxtBox1.get_node("LineEdit").editable = editable
	%RangeTxtBox2.get_node("LineEdit").editable = editable

func connect_signals():
	Events.range1_changed.emit(Values.range1_value)
	Events.range2_changed.emit(Values.range2_value)

func _on_range1_text_changed(text: String):
	Values.range1_value = abs(int(text))
	if int(text) < 0:
		range_txt_box1.text = str(Values.range1_value)
	if Values.range1_value == Values.range2_value:
		Values.range2_value += 1
		if Values.range2_value == 100:
			Values.range2_value = Values.range1_value - 1
		range_txt_box2.text = str(Values.range2_value)
		
	print(Values.range1_value)
	connect_signals()

func _on_range2_text_changed(text: String):
	Values.range2_value = abs(int(text))
	if int(text) < 0:
		range_txt_box2.text = str(Values.range2_value)
	if Values.range1_value == Values.range2_value:
		Values.range1_value -= 1
		if Values.range1_value == -1:
			Values.range1_value = Values.range2_value + 1
		range_txt_box1.text = str(Values.range1_value)
		
	print(Values.range2_value)
	connect_signals()
