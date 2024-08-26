extends Area2D

signal sknife
@onready var labelFBaseKnife = $"FBaseKnife-label"
var nearFBaseKnife: bool = false
var visited = false
@onready var knife = $".."

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelFBaseKnife.hide()
	print("labelFBaseKnife hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	if visited == false:
			labelFBaseKnife.show()
			print("labelFBaseKnife shown")
	nearFBaseKnife = true
	

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelFBaseKnife.hide()
	nearFBaseKnife = false
	print("labelFBaseKnife hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearFBaseKnife == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/knife.dtl")
			print("dialogue started")
			labelFBaseKnife.hide()
			QuestCounter.sknife = true
			sknife.emit(true)
			visited = true
			knife.hide()
			print("labelFBaseKnife hidden")
