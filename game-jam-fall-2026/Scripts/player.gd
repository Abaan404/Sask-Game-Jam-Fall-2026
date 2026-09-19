extends CharacterBody2D

class_name Player

@export var speed: float = 300.0
@export var jump: float = -400.0

@export var gliding: bool = false
@export var gliding_strength: float = 0.3

var camera: Camera2D

@export var abilities: Array[Ability]

func _ready() -> void:
	for ability in abilities:
		ability.player = self

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		# only change the y component if gliding
		if gliding:
			velocity.y *= gliding_strength

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

func start_gliding():
	gliding = true

func stop_gliding():
	gliding = false
