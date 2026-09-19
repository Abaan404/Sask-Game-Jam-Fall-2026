extends Ability

class_name GlidingLeaf

@export var sprite: Sprite2D
var stopped: bool = false

func start() -> void:
	super.start()

	sprite.show()
	player.start_gliding()
	stopped = false

func stop() -> void:
	super.stop()

	sprite.hide()
	player.stop_gliding()
	stopped = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not player.jumped and Input.is_action_just_pressed("up"):
		toggle()
	
	if player.is_on_floor() and !stopped:
		stop()
