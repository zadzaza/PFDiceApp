extends MarginContainer

@export var flip_h: bool

func _ready() -> void:
	$TextureRect.flip_h = self.flip_h
