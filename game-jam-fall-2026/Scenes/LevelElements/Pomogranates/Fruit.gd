extends Node2D

class_name Fruit

@export var decay_time_ms: float = 3000.0

var decay_counter: float = 0.0
var player: Player

func _process(delta: float)-> void:
	decay_counter = max(0.0, decay_counter - delta * 1000.0)

	if player:
		player.fruity = decay_counter > 0.0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if decay_counter <= 0.0:
		return

	if body is not Player:
		return

	var player: Player = body

	for ability in player.abilities:
		if ability is FruitAbility:
			self.player = player
			break

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is not Player:
		return

	var player: Player = body
	player.fruity = false
	self.player = null
