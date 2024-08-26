extends Area2D

@onready var labelHallRecordStorage = $"bass-recordstorage-area-label"
var nearHallRecordStorage: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelHallRecordStorage.hide()
	print("labelHallRecordStorage hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelHallRecordStorage.show()
	nearHallRecordStorage = true
	print("labelHallRecordStorage shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelHallRecordStorage.hide()
	nearHallRecordStorage = false
	print("labelHallRecordStorage hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearHallRecordStorage == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-room-recordstorage.dtl")
			print("dialogue started")
			labelHallRecordStorage.hide()
			visited = true
			print("labelHallRecordStorage hidden")
