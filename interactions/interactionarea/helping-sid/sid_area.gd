extends Area2D

@onready var labelBassSid = $"sid-area-label"
var nearBassSid: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelBassSid.hide()
	print("labelBassSid hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelBassSid.show()
	nearBassSid = true
	print("labelBassSid shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelBassSid.hide()
	nearBassSid = false
	print("labelBassSid hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearBassSid == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-room-asksid.dtl")
			print("dialogue started")
			labelBassSid.hide()
			visited = true
			print("labelBassSid hidden")
