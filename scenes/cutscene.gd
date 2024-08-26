extends Node2D

@onready var SceneTransitionAnimation = $SceneTransitionAnimation

func _ready():
	#SceneTransitionAnimation.get_parent().get_node("ColorRect").color.a = 255
	
	#Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("intro_cutscene")
	Dialogic.signal_event.connect(_on_dialogic_signal)


func _on_dialogic_signal(argument:String):
	if argument == "CS-1":
		print("instansing basement without player...")
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/basement.tscn")
		
	elif argument == "RETURN_TO_TITLE":
		SceneTransitionAnimation.play("fade in")
		print("returning to title...")
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	elif argument == "load-basement-sid":
		print("instansing basement for sid questline...")
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/basement-sid.tscn")
