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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if not player.jumped and not player.climbing and Input.is_action_just_pressed(player.input_up):
		toggle()
		print("fdfd")

	if player.is_on_floor() and !stopped:
		stop()
