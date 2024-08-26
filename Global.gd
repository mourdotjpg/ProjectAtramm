extends Node
# This is a global autoload script

# --- @onready music buses
# --- FILL HERE WHEN YOU HAVE BUSES
var pause_menu_open: bool = false
var pause_menu_scene: PackedScene = preload("res://scenes/PauseMenu.tscn")
var pause_menu = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel") and pause_menu_open == false:
		open_pause_menu()
		pause_menu_open = true
	elif Input.is_action_just_pressed("ui_cancel") and pause_menu_open == true:
		pause_menu.hide()
		pause_menu_open = false
		print("pause menu CLOSED")

func open_pause_menu():
	if not pause_menu:
		pause_menu = pause_menu_scene.instantiate()
		get_tree().root.add_child(pause_menu)
		pause_menu_open = true
		print("pause menu INSTANTIATED")
	else:
		pause_menu.show()
		pause_menu_open = true
		print("pause menu OPEN")
		#push_warning('pause menu already exists in the scene')
