extends MarginContainer

@onready var v_box_container: VBoxContainer = $VBoxContainer/SmoothScrollContainer/MarginContainer/VBoxContainer
@onready var smooth_scroll_container: SmoothScrollContainer = $VBoxContainer/SmoothScrollContainer

func _ready() -> void:
	for i in range(20):
		var card_instance = load("res://scenes/history_card.tscn").instantiate()
		v_box_container.add_child(card_instance)
		card_instance.set_card(randi_range(100000000, 999999999), "21.12.2024", "9210627964", randi_range(0, 30), randi_range(60, 100), randf_range(0, 2), randf_range(10, 30), 145, randi_range(-100000, 100000))
	
	$VBoxContainer/StatsTopPanel.get_node("MarginContainer/VBoxContainer/HBoxContainer/BackBtn").pressed.connect(_on_back_btn_connect)
	
func animate(node: Control):
	var tween = create_tween()
	tween.tween_property(node, "modulate", Color(1, 1, 1, 0), .1).from_current()
	await tween.finished
	node.visible = false
	smooth_scroll_container.pos = Vector2.ZERO

func _on_back_btn_connect():
	animate(self)
