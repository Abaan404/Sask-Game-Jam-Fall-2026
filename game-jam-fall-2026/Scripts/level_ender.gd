extends Node2D


@export var next_level: PackedScene
var player_list: Array[Player]


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player_list.append(body)
		
		body.can_move = false
		body.velocity = Vector2.ZERO
		body.move_and_slide()
		
		body.physics_interpolation_mode = Node.PHYSICS_INTERPOLATION_MODE_OFF
		
		if player_list.size() > 1:
			print("all players are in.")
			
			var level_node: level_container = get_parent().get_parent()
			level_node.load_new_level.emit(next_level)
			get_parent().queue_free()
 

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player_list.erase(body)
