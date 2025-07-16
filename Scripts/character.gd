extends CharacterBody3D

# Movement parameters
@export var speed := 5.0
@export var jump_strength := 4.5
@export var gravity := 9.8
@export var mouse_sensitivity := 0.002

func _physics_process(delta):
	# Handle Jump
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_strength
	
	# Add gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Get the input direction
	var input_dir = Input.get_vector("camera_move_left", "camera_move_right", "camera_move_up", "camera_move_down")
	
	# Calculate movement direction relative to camera orientation
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Handle movement
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		# Gradually slow down when no input
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	# Move the character
	move_and_slide()
