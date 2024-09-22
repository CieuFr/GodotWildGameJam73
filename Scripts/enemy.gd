extends Node2D

class_name Enemy

@onready var animation_player = $Sprite2D/AnimationPlayer
@onready var timer = $Timer
@export var deathVFX : PackedScene

var target : Tower_floor

@export var health = 20
@export var speed = 1 
@export var damage = 1

func _find_target_floor():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target != null : 
		position += position.direction_to(target._get_middle_of_tower_position()) * speed * delta * 20
	else : 
		position.x += 10 * delta * speed
	

func _take_damage(damage):
	health -= damage
	if health <= 0 : 
		_die()
	
func _deal_damage(tower_floor):
	tower_floor._take_damage(damage)
	_die()
	
func _die() :
	if deathVFX != null : 
		var vfx = deathVFX.instantiate()
		vfx.position = position
		get_tree().current_scene.add_child(vfx)
		vfx.get_node("CPUParticles2D").emitting = true
	queue_free()
		
	
	
	

func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
