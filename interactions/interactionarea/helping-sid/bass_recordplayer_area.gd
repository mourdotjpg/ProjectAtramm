extends Area2D

@onready var labelBassRecordPlayer = $"bass-recordplayer-area-label"
var nearBassRecordPlayer: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelBassRecordPlayer.hide()
	print("labelBassRecordPlayer hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelBassRecordPlayer.show()
	nearBassRecordPlayer = true
	print("labelBassRecordPlayer shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelBassRecordPlayer.hide()
	nearBassRecordPlayer = false
	print("labelBassRecordPlayer hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearBassRecordPlayer == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-room-recordplayer.dtl")
			print("dialogue started")
			labelBassRecordPlayer.hide()
			visited = true
			print("labelBassRecordPlayer hidden")
