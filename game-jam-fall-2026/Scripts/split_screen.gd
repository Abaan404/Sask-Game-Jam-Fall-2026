extends Node

@export var viewport1: SubViewport
@export var cam1: Camera2D
@export var viewport2: SubViewport
@export var cam2: Camera2D


@export var level_container: level_container
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cur_level = SignalHub.current_level.instantiate()
	level_container.add_child(cur_level)
	
	viewport2.world_2d = viewport1.world_2d
	
	SignalHub.cam1 = cam1
	SignalHub.cam2 = cam2
	
	level_container.load_new_level.connect(_new_level)


func _new_level(scene: PackedScene):
	for child in level_container.get_children():
		child.queue_free()
	
	var level = scene.instantiate()
	
	level_container.call_deferred("add_child", level)
