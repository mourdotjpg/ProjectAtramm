extends CollisionShape2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var SceneTransitionAnimation = $"../../SceneTransitionAnimation"


#func _ready() -> void:
	#interaction_area.interact = Callable(self, "_on_interact")

func _on_body_entered():
	print("YES!")
	pass

func _on_body_exited():
	print("NO!")
	pass


func _on_interact():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("trans_basement-hall")

func _on_dialogic_signal(argument: String):
	if argument == "move_to_hall":
		print("movint to hall...")
		SceneTransitionAnimation.play("fade in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/hallway.tscn")
