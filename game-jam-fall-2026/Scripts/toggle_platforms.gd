extends Ability

class_name TogglePlatform

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(player.input_down):
		trigger()

func start() -> void:
	SignalHub.toggle_platforms.emit()
