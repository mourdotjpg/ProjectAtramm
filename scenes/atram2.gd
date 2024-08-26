extends CharacterBody2D

class_name Player

const SPEED = 300
var player_state


@onready var animatedSprite = $AnimatedSprite2D

	# Get the input direction and handle the movement/deceleration.
func _physics_process(_delta: float) -> void:	
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
	#print(direction.x,direction.y)
	move_and_slide()
	
	# displaying correct animations for 8-way movement
	if player_state == "idle":
		animatedSprite.play("idle")
	elif player_state == "walking":
		# 4-way
		if direction.y == -1:
			animatedSprite.play("up")
		elif direction.x == 1:
			animatedSprite.play("right")
		elif direction.y == 1:
			animatedSprite.play("down")
			#animatedSprite.animation = "down"
		elif direction.x == -1:
			animatedSprite.play("left")
		# 8-way
		elif direction.y < 0 and direction.x > 0:
			animatedSprite.play("upright")
		elif direction.y < 0 and direction.x < 0:
			animatedSprite.play("upleft")
		elif direction.y > 0 and direction.x > 0:
			animatedSprite.play("downright")
		elif direction.y > 0 and direction.x < 0:
			animatedSprite.play("downleft")
			
#func _rotateeee():
	#if 
		#animatedSprite.play("spin")
	
	
		
