extends TileMap

class_name Tower_floor

@export var turretmodel : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	_instanciate_turret(turretmodel,true)
	_instanciate_turret(turretmodel,false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	
func _get_middle_of_tower_position():
	return position + Vector2(88,-32)
	
func _take_damage(damage):
	pass 

	
func _instanciate_turret(turret,isleft):
	var turretinstance = turret.instantiate()
	turretinstance.position = Vector2(8,-24) if isleft else Vector2(168,-24)
	if isleft :
		turretinstance.rotation = PI
	add_child(turretinstance)
	pass
	

func _on_area_2d_body_entered(body):
	if body.is_in_group("Worker"):
		body.emit_signal("CanDrop",true)
	if body.is_in_group("Enemy"):
		print("hit")
		body.get_parent()._deal_damage(self)
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group("Worker"):
		body.emit_signal("CanDrop",false)
	pass # Replace with function body.
