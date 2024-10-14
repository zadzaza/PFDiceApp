extends MarginContainer

#func _ready() -> void:
	#Events.sum_updated.connect(_on_sum_updated)
#
#func _on_sum_updated(sum: int):
	#$MarginContainer/Label.text = str(sum) + " сум"
