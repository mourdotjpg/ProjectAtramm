extends CharacterBody2D


const SPEED = 100

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
func _physics_process(delta: float) -> void:	
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		self.velocity = direction * SPEED
	else:
		self.velocity = Vector2.ZERO
	# normalize diagonal speed 
	#velocity = velocity.normalized()
	move_and_slide()
