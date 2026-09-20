extends Node2D


@export var next_level: PackedScene
var player_list: Array[Player]


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player_list.append(body)
		
		if player_list.size() > 1:
			print("all players are in.")
			
			var level_node: Node2D = get_parent().get_parent()
			var next_level_instance = next_level.instantiate()
			level_node.add_child(next_level_instance)
			get_parent().queue_free()
 

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		player_list.erase(body)
