extends Node2D

@export var player: Player
@export var Orpheus: AnimatedSprite2D
@export var Eurydice: AnimatedSprite2D
var sprite: AnimatedSprite2D

var dir: int = 1
var last_dir: int 

func _ready() -> void:
	if player.is_player_2:
		sprite = Eurydice
		Orpheus.visible = false
	else:
		sprite = Orpheus
		Eurydice.visible = false
	
	last_dir = dir


func _process(delta: float) -> void:
	if last_dir != sign(player.velocity.x) and player.velocity.x != 0:
		dir = -dir
		last_dir = dir
		sprite.flip_h = !sprite.flip_h
	
	
	if player.velocity.y < 0:
		sprite.play("jump")
	elif player.velocity.y > 0:
		sprite.play("fall")
	elif player.velocity != Vector2.ZERO:
		sprite.play("run")
	else:
		sprite.play("idle")
