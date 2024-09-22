extends Node2D

@export var floor : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var floorinstance = floor.instantiate()
	floorinstance.position = position + Vector2(32,-16) + 1 * Vector2(0,-96)
	get_tree().current_scene.add_child(floorinstance)
	
	floorinstance = floor.instantiate()
	floorinstance.position = position + Vector2(32,-16) + 2 * Vector2(0,-96)
	get_tree().current_scene.add_child(floorinstance)
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
