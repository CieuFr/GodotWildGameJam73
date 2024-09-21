extends Node2D

class_name Turret
@onready var area = $Area2D
@onready var collision_shape = $Area2D/CollisionShape2D
@export var turret_damage = 5
var target : Enemy
var max_range = 100
var in_range_enemies : Array[Enemy]

# Called when the node enters the scene tree for the first time.
func _ready():
	var circle_collision_shape
	circle_collision_shape = collision_shape.shape as CircleShape2D
	
	if circle_collision_shape : 
		max_range = circle_collision_shape.radius
		

func _select_target():
	var minDistance = max_range
	var new_target
	var in_range_enemies : Array[Enemy]
	for body in area.get_overlapping_bodies():
		var enemy_turret_distance = body.transform.get_origin().distance_to(transform.get_origin())
		if  enemy_turret_distance < minDistance :
			new_target = body.get_parent()
			minDistance = enemy_turret_distance
	if new_target :
		target = new_target as Enemy
				
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_select_target()
	if target :
		look_at(target.transform.get_origin())
		


func _on_attack_cool_down_timeout():
	if target : 
		print("send damage")
		target._take_damage(turret_damage)
