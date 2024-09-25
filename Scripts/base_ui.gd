extends Control
var game_manager : GameManager
var workers = preload("res://Entities/worker_entity.tscn")
const RessourceType = preload("res://Scripts/game_manager.gd").ressources
# Called when the node enters the scene tree for the first time.
func _ready():
	game_manager = get_owner().get_node("GameManager")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	var can_buy = game_manager.can_buy(RessourceType.DEVOTION,int($NinePatchRect/VBoxContainer/HBoxContainer/HBoxContainer/Label.text))
	if can_buy : 
		var worker = workers.instantiate()
		get_owner().add_child(worker)
		worker.dragging = true
	pass # Replace with function body.
