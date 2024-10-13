extends MarginContainer
#
#@onready var check_btn1: CheckBtn = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/CheckBtn
#@onready var check_btn2: CheckBtn = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/CheckBtn
#@onready var check_btn3: CheckBtn = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer3/CheckBtn
#@onready var check_btn4: CheckBtn = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer4/CheckBtn
#
#func _ready() -> void:
	#check_btn1.pressed.connect(_on_check_btn_pressed1)
	#check_btn2.pressed.connect(_on_check_btn_pressed2)
	#check_btn3.pressed.connect(_on_check_btn_pressed3)
	#check_btn4.pressed.connect(_on_check_btn_pressed4)
#
#func _on_check_btn_pressed1():
	#print("OK")
	#if check_btn1.is_checked:
		#check_btn2.check_btn_pressed.emit(false)
		#check_btn3.check_btn_pressed.emit(false)
		#check_btn4.check_btn_pressed.emit(false)
#
#func _on_check_btn_pressed2():
	#if check_btn2.is_checked:
		#check_btn1.check_btn_pressed.emit(false)
		#check_btn3.check_btn_pressed.emit(false)
		#check_btn4.check_btn_pressed.emit(false)
#
#func _on_check_btn_pressed3():
	#if check_btn3.is_checked:
		#check_btn2.check_btn_pressed.emit(false)
		#check_btn1.check_btn_pressed.emit(false)
		#check_btn4.check_btn_pressed.emit(false)
#
#func _on_check_btn_pressed4():
	#if check_btn4.is_checked:
		#check_btn2.check_btn_pressed.emit(false)
		#check_btn3.check_btn_pressed.emit(false)
		#check_btn1.check_btn_pressed.emit(false)
