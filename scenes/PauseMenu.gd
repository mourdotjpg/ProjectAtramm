extends CanvasLayer

@onready var transition = $"transition-fade"
@onready var pause_menu_open
var options_menu_scene: PackedScene = preload("res://UI/game_options_runtime.tscn")
var options_menu = null
#var pause_menu = $"."

#func _ready():
	#if Input.is_action_just_pressed("ui_cancel"):
		#hide()
#func reopen_menu():
	#if pause_menu_open == false and Input.is_action_just_pressed("ui_cancel"):
		#show()
		#
#@onready

func _on_resumebutton_pressed():
	pause_menu_open = false
	hide()

func _on_optionsbutton_pressed():
	hide()
	pause_menu_open = false
	options_menu = options_menu_scene.instantiate()
	get_tree().root.add_child(options_menu)

func _on_titlemenubutton_pressed():
	hide()
	pause_menu_open = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quitbutton_pressed():
	pause_menu_open = false
	get_tree().quit()
