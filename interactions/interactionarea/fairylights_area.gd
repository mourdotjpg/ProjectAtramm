extends Area2D

@onready var fairylabel = $"fairylights-label"
var nearfairy: bool = false
var visited = false

var interact: Callable = func():
	pass

func _ready():
	fairylabel.hide()
	#connect("body_entered", self, "_on_body_entered")
	#connect("body_exited", self, "_on_body_exited")
	print("fairy label hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	fairylabel.show()
	nearfairy = true
	print("fairy label shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	fairylabel.hide()
	nearfairy = false
	print("fairy label hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearfairy == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/lightbulbs.dtl")
			print("dialogue started")
			fairylabel.hide()
			visited = true
			print("fairy label hidden")
