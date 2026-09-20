extends Button

@export var next_scene: PackedScene
var split_screen: String = "res://Scenes/HUD/split_screen.tscn"

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().change_scene_to_file(split_screen)
	SignalHub.current_level = next_scene
	BackgroundMusic.stream.bus = "Master"
