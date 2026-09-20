extends Ability
class_name Wallclimb


@export var friction_area: Area2D
@export var deccel: float = 0.2
@export var wall_bounce: float = 1.5

var is_sliding: bool = false
var nearby_walls: Array[StaticBody2D]

var jump_dir: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if !player.is_on_floor() and is_sliding:
		player.gliding = true
	else:
		player.gliding = false
	
	if is_sliding:
		player.can_move = false
		if Input.is_action_just_pressed(player.input_up):
			trigger()
	
	if !cooldown:
		player.can_move = true


func start() -> void:
	get_nearest_wall()
	
	var jump_vector = Vector2(jump_dir, 1).normalized()
	jump_vector *= player.jump
	jump_vector *= wall_bounce
	
	await player.physics_done
	player.velocity = jump_vector
	player.move_and_slide()


func get_nearest_wall():
	var nearest_wall: StaticBody2D
	for wall in nearby_walls:
		if nearest_wall == null:
			nearest_wall = wall
			
		if player.global_position.distance_to(wall.global_position) < player.global_position.distance_to(nearest_wall.global_position):
			nearest_wall = wall
	
	#if nereast wall on left jump_dir = -1, if on right jump_dir = 1, else 0.
	jump_dir = sign(player.global_position.direction_to(nearest_wall.global_position).x)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is StaticBody2D:
		nearby_walls.append(body)
		is_sliding = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is StaticBody2D:
		nearby_walls.erase(body)
		
		if nearby_walls.is_empty():
			is_sliding = false
