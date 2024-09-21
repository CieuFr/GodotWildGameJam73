extends Node2D

@onready var game_manager = %GameManager
@onready var timer = $Timer
@export var enemies : PackedScene;
var rng = RandomNumberGenerator.new()

func _ready():
	timer.start();
	pass
	


func _on_timer_timeout():
	var new_enemy = enemies.instantiate()
	get_tree().current_scene.add_child(new_enemy)
	var y = rng.randi_range(0,game_manager.tower_height)
	new_enemy.position.y = y
	new_enemy.position.x = 0
	pass # Replace with function body.
