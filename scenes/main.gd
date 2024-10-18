extends MarginContainer

var throw_count: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.activate_btn_pressed.connect(_on_activate_btn_pressed)
	Events.history_btn_pressed.connect(_on_history_btn_pressed)
	Events.start_autobet.connect(_on_start_autobet)
	Events.stop_autobet.connect(_on_stop_autobet)
	
func start_autobet():
	%WinRange.set_range_editable(false)
	%BottomPanel.set_editable(false)
	$Timer.start()

func stop_autobet():
	%WinRange.set_range_editable(true)
	%BottomPanel.set_editable(true)
	$Timer.stop()

func show_deactivate():
	%BottomPanel.show_deactivate()

func _on_activate_btn_pressed():
	add($Drawer)

func _on_history_btn_pressed():
	add($History)
	
func add(scene):
	var tween = create_tween()
	scene.modulate = Color(1, 1, 1, 0)
	scene.visible = true
	tween.tween_property(scene, "modulate", Color(1, 1, 1), .1).from_current()
	
func _on_timer_timeout() -> void:
	if throw_count > 0:
		Events.bet.emit()
	else:
		Events.stop_autobet.emit()
	throw_count -= 1

func _on_start_autobet():
	throw_count = Values.throw_count - 1
	%WinRange.set_range_editable(false)
	%BottomPanel.set_editable(false)
	$Timer.start()

func _on_stop_autobet():
	%WinRange.set_range_editable(true)
	%BottomPanel.set_editable(true)
	$Timer.stop()
