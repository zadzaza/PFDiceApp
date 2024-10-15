extends MarginContainer

var green_numbers: Dictionary = {
	'0': load("res://PF/Ресурсы/Зеленные цифры/0.png"),
	'1': load("res://PF/Ресурсы/Зеленные цифры/16.png"),
	'2': load("res://PF/Ресурсы/Зеленные цифры/17.png"),
	'3': load("res://PF/Ресурсы/Зеленные цифры/18.png"),
	'4': load("res://PF/Ресурсы/Зеленные цифры/19.png"),
	'5': load("res://PF/Ресурсы/Зеленные цифры/20.png"),
	'6': load("res://PF/Ресурсы/Зеленные цифры/21.png"),
	'7': load("res://PF/Ресурсы/Зеленные цифры/22.png"),
	'8': load("res://PF/Ресурсы/Зеленные цифры/23.png"),
	'9': load("res://PF/Ресурсы/Зеленные цифры/24.png")
}
var red_numbers: Dictionary = {
	'0': load("res://PF/Ресурсы/Красные цифры/0.png"),
	'1': load("res://PF/Ресурсы/Красные цифры/25.png"),
	'2': load("res://PF/Ресурсы/Красные цифры/26.png"),
	'3': load("res://PF/Ресурсы/Красные цифры/27.png"),
	'4': load("res://PF/Ресурсы/Красные цифры/28.png"),
	'5': load("res://PF/Ресурсы/Красные цифры/29.png"),
	'6': load("res://PF/Ресурсы/Красные цифры/30.png"),
	'7': load("res://PF/Ресурсы/Красные цифры/31.png"),
	'8': load("res://PF/Ресурсы/Красные цифры/32.png"),
	'9': load("res://PF/Ресурсы/Красные цифры/33.png")
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.win.connect(_on_win)
	Events.defeat.connect(_on_defeat)

func _on_win(value: float):
	pick_color(green_numbers, value)

func _on_defeat(value: float):
	pick_color(red_numbers, value)

func pick_color(color_dic: Dictionary, value: float):
	var formated_value = ("%05.2f" % value).replace('.', '')
	var numbers = get_tree().get_nodes_in_group("numbers")
	
	var c = 0
	for n in numbers:
		var old_number = n.get_child(0)
		var new_number = old_number.duplicate()
		n.add_child(new_number)
		new_number.texture = color_dic.get(formated_value[c])
		
		var tween = create_tween()
		tween.connect("finished", Callable(self, "_on_tween_completed").bind(n))
		tween.tween_property(new_number, "modulate", Color(1, 1, 1, 1), 0.2).from(Color(1, 1, 1, 0))
		c += 1

func _on_tween_completed(number):
	var childs = number.get_children()
	if len(childs) > 1:
		childs[0].queue_free()
