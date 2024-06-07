extends CharacterBody2D

const DRAG = .1
const SPEED = 75.0
const JUMP_VELOCITY = -150.0
const BOOST_VELOCITY = 300.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var flare = $Flare

var boosted = false;

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	elif boosted:
		velocity = Vector2(0, 0)
		boosted = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed('ui_cancel'):
		flare.fire()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if !is_on_floor():
		animated_sprite.play('jump');
	else:
		if direction:
			animated_sprite.flip_h = direction == -1
			animated_sprite.play('run');
		else:
			animated_sprite.play('idle');
	
	if direction:
		if SPEED >= abs(velocity.x):
			velocity.x = direction * SPEED
		elif boosted && direction != velocity.x / abs(velocity.x):
			velocity.x += direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, DRAG if boosted else SPEED)

	move_and_slide()


func _on_flare_boosted(blast_direction) -> void:
	if blast_direction == Vector2(0, 0):
		return
		
	if not is_on_floor():
		velocity = BOOST_VELOCITY * blast_direction
		boosted = true
	pass # Replace with function body.
