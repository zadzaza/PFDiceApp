extends MarginContainer

@onready var smooth_scroll_container: SmoothScrollContainer = $SmoothScrollContainer
@onready var main = get_parent()

func _on_save_btn_pressed() -> void:
	if Values.throw_count > 0:
		animate(self)
		Events.stop_autobet.emit()
		main.show_deactivate()
	else:
		smooth_scroll_container.scroll_to_top(0.3)

func _on_cancel_btn_pressed() -> void:
	animate(self)

func animate(node: Control):
	var tween = create_tween()
	tween.tween_property(node, "modulate", Color(1, 1, 1, 0), 0.1).from_current()
	await tween.finished
	node.visible = false
	smooth_scroll_container.pos = Vector2.ZERO
	
	#smooth_scroll_container.scroll_to_top(0.2)
	#var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
	#tween.tween_property(self, "position:y", get_viewport().get_visible_rect().size.y, 0.7)


#func _on_smooth_scroll_container_scroll_ended() -> void:
	#if smooth_scroll_container.pos.y > 250:
		#var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
		#tween.tween_property(self, "position:y", get_viewport().get_visible_rect().size.y, 0.5)

func _on_smooth_scroll_container_scroll_started() -> void:
	#print("started")
	pass
