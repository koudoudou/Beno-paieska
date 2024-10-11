extends Node2D

@onready var pause_menu = $CharacterBody2D/Camera2D/PauseMenu
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if State.player_position == Vector2():
		position = -Vector2(185, 528)
	if State.player_position != Vector2():  # Ensure there's a valid saved position.
		position = -State.player_position  # Restore the saved position.
	pause_menu.hide()	

func _process(delta: float) -> void:
	if not State.know_location:
		$MushroomBasket.get_node("CollisionShape2D").disabled = true
		$MushroomBasket.visible = false
	else:
		$MushroomBasket.get_node("CollisionShape2D").disabled = false
		$MushroomBasket.visible = true
	if State.has_mushroom_basket:
		State.know_location = false
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

	if State.has_accepted_quest:
		$Entrances/Node2D.get_node("CafeArea/CollisionShape2D").disabled = false
		$Entrances/Node2D.get_node("SalonArea/CollisionShape2D").disabled = false
	else:
		$Entrances/Node2D.get_node("CafeArea/CollisionShape2D").disabled = true
		$Entrances/Node2D.get_node("SalonArea/CollisionShape2D").disabled = true
		
	if State.has_won:
		get_tree().change_scene_to_file("res://tscn_files/ending_scene.tscn")

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
