extends Area2D

@onready var labelBox = $"box-label"
var nearBox: bool = false
var visited = false
@onready var book = $"../box-with-book"
#@onready var can_leave

var interact: Callable = func():
	pass

func _ready():
	labelBox.hide()
	print("box label hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelBox.show()
	print("box label shown")
	nearBox = true

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelBox.hide()
	print("box label hidden")
	nearBox = false
	
func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearBox == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/sus_box.dtl")
			print("dialogue started")
			labelBox.hide()
			visited = true
			#can_leave = can_leave + 1
			#print("fairy label hidden")
			#print("can_leave = ")
			#print(can_leave)
