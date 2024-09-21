extends CharacterBody2D

var sprite 
var dragging = false
var posBeforeDrag
var canDrop = false
var of = Vector2(0,0)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal CanDrop(bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.region_rect=Rect2(408+17*randi_range(0,7),17*randi_range(0,4),16,16)
	pass # Replace with function body.


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity* 0.1 * delta
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging :
		position = get_global_mouse_position() - of

func _on_input_event(viewport, event, shape_idx):
	if (event.is_action_pressed("select")):
		dragging = true
		posBeforeDrag = position
		of = get_global_mouse_position() - global_position
	if (event.is_action_released("select")):
		dragging = false
		if not canDrop : 
			position = posBeforeDrag


func _on_can_drop(pCandrop):
	canDrop=pCandrop
