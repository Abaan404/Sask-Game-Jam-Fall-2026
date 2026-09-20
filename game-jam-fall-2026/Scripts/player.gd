extends CharacterBody2D
class_name Player

signal physics_done

@export var camera_transform: RemoteTransform2D
@export var respawn_point: Node2D

@export var accel: float = 25
@export var deccel: float = 20
@export var max_speed: float = 400.0
@export var jump: float = -400.0

var can_move: bool = true
@export var can_climb: bool = false

@export var jumped: bool = false

@export var climbing: bool = false
@export var climbing_direction: String = "left"

@export var gliding: bool = false
@export var gliding_strength: float = 0.8

@export var fruity: bool = false

@export var is_player_2: bool 

var input_up: String = "up"
var input_down: String = "down"
var input_left: String = "left"
var input_right: String = "right"

@export var abilities: Array[Ability]

func _ready() -> void:
	for ability in abilities:
		ability.player = self
	if is_player_2:
		input_up += "2"
		input_down += "2"
		input_left += "2"
		input_right +="2"


func _process(delta: float) -> void:
	if camera_transform.remote_path == NodePath(""):
		if is_player_2 and SignalHub.cam2 != null:
			camera_transform.remote_path = SignalHub.cam2.get_path()
		elif SignalHub.cam1 != null:
			camera_transform.remote_path = SignalHub.cam1.get_path()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		# only change the y component if gliding and moving downwards
		if gliding and velocity.y > 0:
			velocity.y *= gliding_strength

	# Handle jump.
	jumped = Input.is_action_just_pressed(input_up) and is_on_floor() or fruity
	if jumped:
		velocity.y = jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction := Input.get_axis(input_left, input_right)

	if can_move:
		if horizontal_direction and velocity.x < max_speed:
			velocity.x = move_toward(velocity.x, max_speed * horizontal_direction, accel)
		else:
			velocity.x = move_toward(velocity.x, 0, deccel)

	if climbing and can_climb:
		var vertical_direction := Input.get_axis(input_up, input_down)

		if vertical_direction:
			velocity.y = vertical_direction * max_speed
		else:
			velocity.y = move_toward(velocity.y, 0, max_speed)

	move_and_slide()

	physics_done.emit()

func start_gliding():
	gliding = true

func stop_gliding():
	gliding = false
	
func respawn():
	position = respawn_point.position + Vector2(0, -32)
