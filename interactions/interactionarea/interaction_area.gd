extends Area2D
class_name InteractionArea

@export var action_name : String  = "interact"
@onready var label = $Interact_label2
@onready var SceneTransitionAnimation = $"../../../SceneTransitionAnimation"
var nearStairs: bool = false

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
	if nearStairs == true and event.is_action_pressed("interact"):
		Dialogic.signal_event.connect(_on_dialogic_signal)
		Dialogic.start_timeline("trans_basement-hall")

func _on_dialogic_signal(argument: String):
	if argument == "move_to_hall":
		print("moving to hall...")
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/hallway.tscn")
