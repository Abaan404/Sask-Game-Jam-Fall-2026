extends Node2D

class_name Fruit

@export var active: bool = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not active:
		return

	if body is not Player:
		return

	var player: Player = body

	for ability in player.abilities:
		if ability is FruitAbility:
			player.fruity = true
			break

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is not Player:
		return

	var player: Player = body
	player.fruity = false
