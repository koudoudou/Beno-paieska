extends CharacterBody2D

var speed = 150
var click_position = Vector2()
var target_position = Vector2()
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

func _ready():
	click_position = position

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("left_click"):

		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() >0:
			
			actionables[0].action()
			return
	
func _physics_process(float):
	if Input.is_action_just_pressed("right_click"):
		click_position = get_global_mouse_position()
		
	if position.distance_to(click_position) > 3:
		target_position = (click_position - position).normalized()
		velocity = target_position * speed
		move_and_slide()
