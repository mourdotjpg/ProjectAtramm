extends Area2D

@onready var labelHallGraffiti = $"hall-junk-area-label2"
var nearHallGraffiti: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF ------

func _ready():
	labelHallGraffiti.hide()
	print("labelHallGraffiti hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelHallGraffiti.show()
	nearHallGraffiti = true
	print("labelHallGraffiti shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelHallGraffiti.hide()
	nearHallGraffiti = false
	print("labelHallGraffiti hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearHallGraffiti == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-hall-graffiti.dtl")
			print("dialogue started")
			labelHallGraffiti.hide()
			visited = true
			print("labelHallGraffiti hidden")
