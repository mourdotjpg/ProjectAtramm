extends Area2D

@onready var labelFBasementPentagram = $basement_penta_label
@onready var paint = $"../../paint1"
@onready var pentaSmudged = $".."
@onready var pentaClean = $"../../basement_petagram_clean"
@onready var candleFallen = $"../../candle1"
@onready var candleBurning = $"../../cleanCandlePacked"

var nearFBasementPentagram: bool = false
var visited = false

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelFBasementPentagram.hide()
	print("labelFBasementPentagram hidden")
	candleBurning.hide()

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelFBasementPentagram.show()
	nearFBasementPentagram = true
	print("labelFBasementPentagram shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelFBasementPentagram.hide()
	nearFBasementPentagram = false
	print("labelFBasementPentagram hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearFBasementPentagram == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/sid-fbase-penta.dtl")
			Dialogic.signal_event.connect(switch_stuff)
			print("dialogue started")
			QuestCounter.spenta = true
			print("pentagram clear, global quest counted")
			labelFBasementPentagram.hide()
			visited = true
			print("labelFBasementPentagram hidden")

func switch_stuff(argument: String):
	if argument == "switch_penta":
		pentaClean.show()
		pentaSmudged.hide()
	elif argument == "switch_candle":
		candleFallen.hide()
		candleBurning.show()
