extends Node

class_name Ability

var player: Player
var active: bool

var cooldown: bool
var cooldown_time_ms_counter: float
@export var cooldown_time_ms: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cooldown = cooldown_time_ms_counter > 0

	if (cooldown):
		cooldown_time_ms_counter -= delta

func start() -> void:
	active = true
	
func stop() -> void:
	active = false
	
func trigger() -> void:
	cooldown_time_ms_counter = cooldown_time_ms

	start()
	stop()
	
func toggle() -> void:
	cooldown_time_ms_counter = cooldown_time_ms

	if (!active):
		start()
	else:
		stop()
