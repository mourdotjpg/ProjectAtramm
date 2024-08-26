extends Area2D

@export var action_name : String  = "interact"
@onready var label = $Interact_label2
@onready var SceneTransitionAnimation = $"../../../SceneTransitionAnimation"
var nearStairs: bool = false
@onready var can_leave

var interact: Callable = func():
	pass

func _ready():
	label.hide()

func _on_body_entered(_body: CharacterBody2D) -> void:
	label.show()
	nearStairs = true

func _on_body_exited(_body: CharacterBody2D) -> void:
	label.hide()
	nearStairs = false
	
func _input(event):
	if nearStairs == true and event.is_action_pressed("interact") and QuestCounter.squest == true:
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/hallway.tscn")
		Dialogic.start("res://interactions/dialogic-timelines/helping-sid/sid-hall-1.dtl")
