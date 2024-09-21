extends Node2D

class_name Turret
@onready var area = $Area2D
@onready var collision_shape = $Area2D/CollisionShape2D
@onready var turret_particles : CPUParticles2D = $Laser/CPUParticles2D
@onready var cooldown_timer = $Attack_CoolDown
@export var turret_damage = 5
@export var turret_cooldown = 1
var target : Enemy
var max_range = 100
var in_range_enemies : Array
var base_particle_lifetime

# Called when the node enters the scene tree for the first time.
func _ready():
	base_particle_lifetime = turret_particles.lifetime
	cooldown_timer.wait_time = turret_cooldown
	var circle_collision_shape
	circle_collision_shape = collision_shape.shape as CircleShape2D
	
	if circle_collision_shape : 
		max_range = circle_collision_shape.radius
	
#func _select_target():
	#var minDistance = max_range
	#var new_target
	#for enemy in in_range_enemies:
		#var enemy_turret_distance = enemy.global_position.distance_to(global_position)
		#if enemy_turret_distance < minDistance : 
			#minDistance = enemy_turret_distance
			#new_target = enemy
	#if new_target != null : 
		#target = new_target as Enemy
			
func _select_target():
	var minDistance = max_range
	var new_target
	var in_range_enemies = area.get_overlapping_bodies()
	for body in in_range_enemies : 
		var enemy_turret_distance = body.global_position.distance_to(global_position)
		if  enemy_turret_distance < minDistance :
			new_target = body.get_parent()
			minDistance = enemy_turret_distance
	if new_target :
		target = new_target as Enemy
					
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	_select_target()
	if target != null && !target.is_queued_for_deletion():
		look_at(target.transform.get_origin())
		_fire()
	
func _fire():
	if cooldown_timer.is_stopped() : 
		
		cooldown_timer.start(turret_cooldown)
		turret_particles.emitting = true
		turret_particles.lifetime = (target.transform.origin.distance_to(transform.origin) * base_particle_lifetime) /  max_range
		await get_tree().create_timer(turret_particles.lifetime).timeout
		if target != null : 
			target._take_damage(5)
			
		
func _on_attack_cool_down_timeout():
	pass
	
func _on_area_2d_body_entered(body):
	in_range_enemies.append(body)


func _on_area_2d_body_exited(body):
	in_range_enemies.remove_at(in_range_enemies.find(body))
	

func _on_attack_travel_time_timeout():
	print("called")
	
