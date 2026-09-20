extends Node2D

class_name Root

@export var fruits: Array[Fruit]

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Player:
		return

	var player: Player = body

	for ability in player.abilities:
		if ability is RootAbility:
			for fruit in fruits:
				fruit.decay_counter = fruit.decay_time_ms
			break

func _on_area_2d_body_exited(body: Node2D) -> void:
	pass
