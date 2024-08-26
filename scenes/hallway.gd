extends Node2D

@onready var SceneTransitionAnimation = $SceneTransitionAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	SceneTransitionAnimation.play("fade out")

	# ----- тест диалоджика (уже не нужен)
	#Dialogic.signal_event.connect(_on_dialogic_signal)
	#Dialogic.start("timeline")


#func _on_dialogic_signal(argument: String):
	#if argument == "its a signal":
		#print("A signal war fired via Dialogic....")
	
