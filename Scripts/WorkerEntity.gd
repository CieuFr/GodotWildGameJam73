extends CharacterBody2D



var sprite 
var dragging = false
var posBeforeDrag
var canDrop = false
var of = Vector2(0,0)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 20
var direction = 1
var timeBeforeNextMovement
var time_start=0
var devotion_generation=10
var game_manager : GameManager
signal CanDrop(bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	game_manager = get_parent().get_node("GameManager")
	print(game_manager)
	timeBeforeNextMovement=randf_range(1,3);
	time_start = Time.get_unix_time_from_system()
	$Sprite2D.region_rect=Rect2(408+17*randi_range(0,7),17*randi_range(0,4),16,16)
	pass # Replace with function body.


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity* 0.1 * delta
	velocity.x = speed * direction
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging :
		position = get_global_mouse_position() - of
		pass
	if Time.get_unix_time_from_system() - time_start > timeBeforeNextMovement :
		direction = randi_range(-1,1)
		timeBeforeNextMovement=randf_range(1,3);
		time_start = Time.get_unix_time_from_system()
	

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


func _on_devotion_timer_timeout():
	game_manager.add_devotion(devotion_generation)
	pass # Replace with function body.
