extends Area2D

@onready var labelFBasePaint = $"bucket-paint-area-label"
@onready var paper = $"../../paperclutter"
@onready var paint = $"../../paint1"
var nearFBasePaint: bool = false
var visited = false
@onready var can_leave

# --- DONT FORGET TO CONNECT FUNCTION INTO ITSELF AND CHANGE LABEL ------

func _ready():
	labelFBasePaint.hide()
	print("labelFBasePaint hidden")

func _on_body_entered(_body: CharacterBody2D) -> void:
	labelFBasePaint.show()
	nearFBasePaint = true
	print("labelFBasePaint shown")

func _on_body_exited(_body: CharacterBody2D) -> void:
	labelFBasePaint.hide()
	nearFBasePaint = false
	print("labelFBasePaint hidden")

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if nearFBasePaint == true and event.is_action_pressed("interact") and visited == false:
			Dialogic.start("res://interactions/dialogic-timelines/helping-sid/objects/paint.dtl")
			Dialogic.signal_event.connect(resolve)
			print("dialogue started")
			labelFBasePaint.hide()
			QuestCounter.spaint = true
			visited = true
			print("labelFBasePaint hidden")

func resolve(argument:String):
	if argument == "cover_paint":
		paper.move_local_x(650)
		paper.move_local_y(-200)
		paint.hide()
		#can_leave = can_leave + 1
		
		
