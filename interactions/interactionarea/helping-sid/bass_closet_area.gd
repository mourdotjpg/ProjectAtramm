extends Area2D

@onready var labelBassCloset = $"bass-closet-area-label"
var nearBassCloset: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelBassCloset.hide()
	print("labelBassCloset hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelBassCloset.show()
	nearBassCloset = true
	print("labelBassCloset shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelBassCloset.hide()
	nearBassCloset = false
	print("labelBassCloset hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearBassCloset == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-room-wardrobe.dtl")
			print("dialogue started")
			labelBassCloset.hide()
			visited = true
			print("labelBassCloset hidden")
