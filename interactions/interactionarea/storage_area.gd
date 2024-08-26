extends Area2D

@onready var storage_label = $storage_area_label2
var nearStorage: bool = false
var visited: bool = false


func _ready():
	storage_label.hide()
	print("storage label hidden (init)")

func _on_body_entered(_body: CharacterBody2D) -> void:
	storage_label.show()
	nearStorage = true
	print("storage area entered")
	print("nearStorage = true")


func _on_body_exited(_body: CharacterBody2D) -> void:
	storage_label.hide()
	print("storage label hidden, visited unchanged")
	nearStorage = false
	print("nearStorage = false")
	
func _input(event):
	if get_node_or_null("DialogNode") == null:
		if visited == false and nearStorage == true and event.is_action_pressed("interact"):
			Dialogic.start("res://interactions/dialogic-timelines/storage.dtl")
			print("dialogic timeline started...")
			visited = true
			print("visited!")
