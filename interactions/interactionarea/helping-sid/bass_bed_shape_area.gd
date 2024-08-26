extends Area2D

@onready var labelBassBed = $"bass-recordstorage-area-label3"
var nearBassBed: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelBassBed.hide()
	print("labelBassBed hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelBassBed.show()
	nearBassBed = true
	print("labelBassBed shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelBassBed.hide()
	nearBassBed = false
	print("labelBassBed hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearBassBed == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-room-bed.dtl")
			print("dialogue started")
			labelBassBed.hide()
			visited = true
			print("labelBassBed hidden")
