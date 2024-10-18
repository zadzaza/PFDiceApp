extends MarginContainer

@onready var bet_txt_box: LineEdit = $MarginContainer/VBoxContainer/BetValue.get_node("VBoxContainer/MarginContainer/MarginContainer/LineEdit")
@onready var deactivate_btn: TextureButton = %DeactivateBtn
@onready var stop_btn: TextureButton = %StopBtn
@onready var bet_btn: TextureButton = %BetBtn
@onready var stop_btn_label: Label = $MarginContainer/VBoxContainer/VBoxContainer/MarginContainer2/StopBtn/Label
@onready var main = get_parent().get_parent()

var autobet: bool = false

func _ready() -> void:
	Events.stop_autobet.connect(_on_stop_autobet)
	Events.bet.connect(_on_bet)

func _on_bet():
	
	var word := ""
	var str_throw_count = str(Values.throw_count)
	var i = 0
	for c in str_throw_count.reverse():
		if i == 3:
			word = " " + word
			i = 0
		word = c + word
		i += 1
	
	stop_btn_label.text = "стоп " + word

func _on_activate_btn_pressed() -> void:
	Events.activate_btn_pressed.emit()

func set_editable(editable: bool):
	bet_txt_box.editable = editable
	%Buttons.get_node("HBoxContainer/Min").disabled = !editable
	%Buttons.get_node("HBoxContainer/2").disabled = !editable
	%Buttons.get_node("HBoxContainer/X2").disabled = !editable
	%Buttons.get_node("HBoxContainer/Max").disabled = !editable

func show_stop_btn():
	stop_btn.visible = true
	
	var tween = create_tween()
	tween.tween_property(stop_btn, "modulate:a", 1.0, 0.1).from(0)

func show_bet_btn():
	var tween = create_tween()
	tween.tween_property(stop_btn, "modulate:a", 0.0, 0.1).from(1.0)
	await tween.finished
	stop_btn.visible = false

func show_deactivate():
	autobet = true
	deactivate_btn.visible = true
	
	var tween = create_tween()
	tween.tween_property(deactivate_btn, "modulate:a", 1.0, 0.1).from(0)

func show_activate():
	autobet = false
	var tween = create_tween()
	tween.tween_property(deactivate_btn, "modulate:a", 0.0, 0.1).from(1.0)
	await tween.finished
	deactivate_btn.visible = false
	
func _on_bet_pressed() -> void:
	if not autobet:
		Events.bet.emit()
	else:
		if is_instance_valid(main):
			if Values.throw_count > 0:
				Events.start_autobet.emit()
				Events.bet.emit()
				show_stop_btn()
				

func _on_stop_autobet() -> void:
	show_bet_btn()

func _on_deactivate_btn_pressed() -> void:
	show_activate()
	Events.stop_autobet.emit()
	show_bet_btn()

func _on_stop_btn_pressed() -> void:
	show_bet_btn()
	Events.stop_autobet.emit()
