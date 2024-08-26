extends Area2D

@onready var labelHallDoor = $"hall-door-area-label"
@onready var SceneTransitionAnimation = $"../../../SceneTransitionAnimation"
@onready var sfx = $"../door sfx"
var nearHallDoor: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF ------

func _ready():
	labelHallDoor.hide()
	print("labelHallDoor hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelHallDoor.show()
	nearHallDoor = true
	print("labelHallDoor shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelHallDoor.hide()
	nearHallDoor = false
	print("labelHallDoor hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearHallDoor == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-hall-door.dtl")
			print("dialogue started")
			labelHallDoor.hide()
			visited = true
			print("labelHallDoor hidden")
		elif nearHallDoor == true and event.is_action_pressed("interact") and visited == true:
			sfx.play()
			SceneTransitionAnimation.play("fade in")
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://scenes/bass.tscn")
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/sid-room-1.dtl")
