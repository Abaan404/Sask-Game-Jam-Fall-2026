extends Node

class_name Ability

@export var cooldown_time_ms: float
@export var is_cooldown: bool
var cooldown_time_ms_counter: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	is_cooldown = cooldown_time_ms_counter > 0

	if (is_cooldown):
		cooldown_time_ms_counter -= delta

func start() -> void:
	pass
	
func stop() -> void:
	pass
	
func trigger() -> void:
	cooldown_time_ms_counter = cooldown_time_ms
	start()
	stop()
