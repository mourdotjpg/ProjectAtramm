extends Node2D

@onready var SceneTransitionAnimation = $SceneTransitionAnimation
@onready var player = $atramm2
var can_leave = 0
# ---------SID QUEST---------
var sknife: bool = false
var sbook: bool = false # imp
var spenta: bool = false #imp
var spaint: bool = false # imp
var squest: bool = false # false if not done, true if done
# --------------------------
func _ready():
	SceneTransitionAnimation.play("RESET")
	SceneTransitionAnimation.play("fade out")
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument: String):
	if argument == "CS-2":
		print("hiding player...")
		player.hide()
		print("successfully hidden player...")
	if argument == "load_basement-sid":
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/hallway.tscn")
		print("loading hallway...")
	if argument == "move_to_hall":
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/hallway.tscn")
		print("loading hallway...")
	if argument == "go_to_black":
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://blackscreen.tscn")
		print("loading hallway...")
		

# ----------- SID QUEST ----------

func _on_knifearea_sqknife() -> void:
	sknife = true
	print("knife recorded")
	
func sidQuest():
	if sknife == true && sbook == true && spenta == true && spaint == true:
		squest = true
		print("squest clear")
