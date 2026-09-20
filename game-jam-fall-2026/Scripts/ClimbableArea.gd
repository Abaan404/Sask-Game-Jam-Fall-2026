extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is not Player:
		return
	
	var player: Player = body

	var position_body = player.transform.get_origin()
	var position_area = transform.get_origin()

	var direction = position_area.direction_to(position_body)	

	if direction.dot(Vector2(0.0, 1.0)) > 0.0:
		player.climbing = true
		player.climbing_direction = "right"
	else:
		player.climbing = true
		player.climbing_direction = "left"

func _on_body_exited(body: Node2D) -> void:
	if body is not Player:
		return
		
	var player: Player = body
	player.climbing = false
