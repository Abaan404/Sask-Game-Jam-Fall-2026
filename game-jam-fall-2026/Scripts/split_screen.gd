extends Node

@export var viewport1: SubViewport
@export var cam1: Camera2D
@export var viewport2: SubViewport
@export var cam2: Camera2D


@export var level_container: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport2.world_2d = viewport1.world_2d

	
	#Gets the level which is under the node named "Level"
	for node in level_container.get_child(0).get_children():
		if node is Player:
			if node.is_player_2:
				node.camera_transform.remote_path = cam2.get_path()
			else:
				node.camera_transform.remote_path = cam1.get_path()
