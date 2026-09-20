extends Path2D
class_name Moving_Platform


@export var time: float = 1

@export var pathfollow: PathFollow2D
@export var moving_platform: Node2D

@export var autostart: bool = false

var forward: bool = true
var moving: bool = false


func _ready():
	if autostart:
		moving = true
	else:
		SignalHub.toggle_platforms.connect(start)

func _physics_process(delta: float) -> void:
	if moving:
		var calc_speed = 1/time * delta
		
		var dir = int(forward)
		
		print(dir)
		pathfollow.progress_ratio = move_toward(pathfollow.progress_ratio, dir, calc_speed)
		if pathfollow.progress_ratio == dir:
			moving = false
	
	if autostart:
		start()


func start():
	if !moving:
		if int(forward) == pathfollow.progress_ratio:
			forward = !forward
		moving = true
