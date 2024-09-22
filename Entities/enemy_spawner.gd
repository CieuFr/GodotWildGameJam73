extends Node2D

@onready var game_manager = %GameManager
@onready var timer = $Timer
@export var enemies : PackedScene;
var rng = RandomNumberGenerator.new()
var phase = 0



func _ready():
	timer.start();
	pass
	
	
func _select_target(area):
	var minDistance = 99999
	var new_target
	var in_range_enemies : Array
	var allchildren = get_parent().get_children()
	
	if !allchildren.is_empty() : 
		for child in allchildren :
			if child is Tower_floor :
				in_range_enemies.push_back(child)
	
	for body in in_range_enemies : 
		var enemy_turret_distance = body.global_position.distance_to(global_position)
		if  enemy_turret_distance < minDistance :
			print("aaaa")
			new_target = body
			print(new_target)
			minDistance = enemy_turret_distance
	if new_target :
		return new_target
	return null

func _on_timer_timeout():
	var new_enemy = enemies.instantiate()
	get_tree().current_scene.add_child(new_enemy)
	var y = rng.randi_range(0,-game_manager.tower_height)
	var side = rng.randi_range(0,2)
	var target = _select_target(new_enemy.get_node("Area2D"))
	
	new_enemy.position.y = y
	new_enemy.position.x = 0 if side else 150+175+150
	var new_enemy_cast = new_enemy as Enemy
	new_enemy_cast.target = target
	
	pass # Replace with function body.

