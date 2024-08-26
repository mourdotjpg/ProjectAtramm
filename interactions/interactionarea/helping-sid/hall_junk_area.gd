extends Area2D

@onready var labelHallJunk = $"hall-junk-area-label"
var nearHallJunk: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF ------

func _ready():
	labelHallJunk.hide()
	print("labelHallJunk hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelHallJunk.show()
	nearHallJunk = true
	print("labelHallJunk shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelHallJunk.hide()
	nearHallJunk = false
	print("labelHallJunk hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearHallJunk == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-hall-trashcan.dtl")
			print("dialogue started")
			labelHallJunk.hide()
			visited = true
			print("labelHallJunk hidden")
