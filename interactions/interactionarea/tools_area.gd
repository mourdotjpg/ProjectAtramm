extends Area2D

@onready var toolLabel = $"tools-label"
var nearTools: bool = false
var visited = false

func _ready():
	toolLabel.hide()
	#connect("body_entered", self, "_on_body_entered")
	#connect("body_exited", self, "_on_body_exited")
	print("toolLabel hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	toolLabel.show()
	nearTools = true
	print("toolLabel shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	toolLabel.hide()
	nearTools = false
	print("toolLabel hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearTools == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/toolbox.dtl")
			print("dialogue started")
			toolLabel.hide()
			visited = true
			print("toolLabel hidden")
