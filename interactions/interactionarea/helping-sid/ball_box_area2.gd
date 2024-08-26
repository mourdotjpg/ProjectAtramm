extends Area2D

@onready var labelHallBoxes = $"hall-box-area-label"
var nearHallBoxes: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelHallBoxes.hide()
	print("labelHallBoxes hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelHallBoxes.show()
	nearHallBoxes = true
	print("labelHallBoxes shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelHallBoxes.hide()
	nearHallBoxes = false
	print("labelHallBoxes hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearHallBoxes == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-hall-boxes.dtl")
			print("dialogue started")
			labelHallBoxes.hide()
			visited = true
			print("labelHallBoxes hidden")
