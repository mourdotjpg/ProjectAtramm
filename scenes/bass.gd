extends Node2D

@onready var SceneTransitionAnimation = $SceneTransitionAnimation


func _ready():
	SceneTransitionAnimation.play("fade out")
	Dialogic.signal_event.connect(_dialogic_change_scene)

func _dialogic_change_scene(argument: String):
	if argument == "change_to_fake_basement":
		print("moving to basement...")
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/basement-sid-end.tscn")
	if argument == "end":
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
