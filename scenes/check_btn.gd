extends Button
class_name CheckBtn

signal check_btn_pressed(is_checked: bool)

@onready var toggle_bg: Sprite2D = $ToggleBg
@onready var ellipse_check: Sprite2D = $EllipseCheck
@onready var marker_1: Marker2D = $Marker1
@onready var marker_2: Marker2D = $Marker2
	
@export var is_checked: bool = false

func _ready() -> void:
	call_deferred("_initialize_signals", is_checked)

func _initialize_signals(_is_checked) -> void:
	self.check_btn_pressed.connect(_on_check_btn_pressed)
	self.check_btn_pressed.emit(_is_checked)

func _on_check_btn_pressed(_is_checked: bool):
	is_checked = _is_checked
	animate(_is_checked)

func animate(_is_checked: bool):
	var tween = create_tween().set_parallel(true)
	var target_position = marker_2.position if _is_checked else marker_1.position
	var target_color = Color(0, 0.702, 0.196) if _is_checked else Color(0.008, 0.098, 0.043)

	tween.tween_property(ellipse_check, "position", target_position, 0.2).from_current()
	tween.tween_property(toggle_bg, "modulate", target_color, 0.2).from_current()


func _on_button_pressed() -> void:
	is_checked = !is_checked
	self.check_btn_pressed.emit(is_checked)
	
	var btns_win = get_tree().get_nodes_in_group("if_win")
	var btns_def = get_tree().get_nodes_in_group("if_def")
	deactivate_if(btns_win)
	deactivate_if(btns_def)

func deactivate_if(btns: Array):
	if self in btns:
		for b in btns:
			if b != self:
				b.check_btn_pressed.emit(false)
