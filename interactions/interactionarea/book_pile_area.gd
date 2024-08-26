extends Area2D

@onready var pileLabel = $"book-pile-label"
var nearPile: bool = false
var visited = false
signal qbook_checked(bool)

var interact: Callable = func():
	pass

func _ready():
	pileLabel.hide()
	#connect("body_entered", self, "_on_body_entered")
	#connect("body_exited", self, "_on_body_exited")
	print("pileLabel hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	pileLabel.show()
	nearPile = true
	print("pileLabel shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	pileLabel.hide()
	nearPile = false
	print("pileLabel hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearPile == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/pile_of_books.dtl")
			print("dialogue started")
			pileLabel.hide()
			visited = true
			print("qbook set to true")
			print("pileLabel hidden")
