extends CharacterBody2D


const SPEED = 100
var player_state

@onready var state_machine = $AnimationTree["parameters/playback"]

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
func _physics_process(delta: float) -> void:	
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		self.velocity = direction * SPEED
	else:
		self.velocity = Vector2.ZERO
		
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
	# normalize diagonal speed 
	#velocity = velocity.normalized()
	move_and_slide()
	
func _play_anim(dir):
	if player_state == "idle":
		$AnimationPlayer.play("down")
	if player_state == "walking":
		if dir.y == -1:
			$AnimationPlayer.play("up")
		if dir.x == 1:
			$AnimationPlayer.play("right")
		if dir.y == 1:
			$AnimationPlayer.play("down")
		if dir.x == -1:
			$AnimationPlayer.play("left")
		
	
