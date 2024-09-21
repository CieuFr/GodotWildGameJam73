extends Node2D

class_name Enemy

@onready var animation_player = $Sprite2D/AnimationPlayer
@onready var timer = $Timer

var target : Tower_floor

var health = 20
var speed = 1 
var damage = 1

func _find_target_floor():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target != null : 
		position += position.direction_to(target.position) * speed * delta * 20
	else : 
		position.x += 10 * delta * speed
	

func _take_damage(damage):
	health -= damage
	print("take damage")
	print(health)
	if health <= 0 : 

		queue_free()
	

func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
