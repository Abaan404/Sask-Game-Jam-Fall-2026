extends Button

@export var next_scene: String

func _ready() -> void:
	pressed.connect(_on_pressed)


func _on_pressed() -> void:
	print("f")
	get_tree().change_scene_to_file(next_scene)
