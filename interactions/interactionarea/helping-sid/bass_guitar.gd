extends Area2D

@onready var labelBassGuitar = $"bass-recordstorage-area-label2"
var nearBassGuitar: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelBassGuitar.hide()
	print("labelBassGuitar hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelBassGuitar.show()
	nearBassGuitar = true
	print("labelBassGuitar shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelBassGuitar.hide()
	nearBassGuitar = false
	print("labelBassGuitar hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearBassGuitar == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-room-guitar.dtl")
			print("dialogue started")
			labelBassGuitar.hide()
			visited = true
			print("labelBassGuitar hidden")
