extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#obtener la dirección del input: -1,0,1
	var direction := Input.get_axis("Move_Left", "Move_Right")
	
	#dar vuelta el sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction <  0:
		animated_sprite.flip_h = true
		velocity.x = direction * SPEED
		
	#play animation
	#chequear si se está en el piso o no
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")
		
	#moverse	
	if direction:
		velocity.x = SPEED * direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
