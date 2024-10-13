extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.activate_btn_pressed.connect(_on_activate_btn_pressed)
	Events.history_btn_pressed.connect(_on_history_btn_pressed)

func _on_activate_btn_pressed():
	add($Drawer)

func _on_history_btn_pressed():
	add($History)

func add(scene):
	var tween = create_tween()
	scene.modulate = Color(1, 1, 1, 0)
	scene.visible = true
	tween.tween_property(scene, "modulate", Color(1, 1, 1), .1).from_current()
	
	
