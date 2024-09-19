extends RigidBody2D

var sprite 
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.region_rect=Rect2(408+17*randi_range(0,7),17*randi_range(0,4),16,16)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
