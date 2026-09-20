extends Node

var current_level: PackedScene = preload("res://Scenes/Levels/test_scene.tscn")
var cam1: Camera2D
var cam2: Camera2D


signal toggle_platforms


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().change_scene_to_file("res://Scenes/HUD/Menus/main_menu.tscn")
