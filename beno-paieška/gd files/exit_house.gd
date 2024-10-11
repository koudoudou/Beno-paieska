extends Area2D

var entered = false

func _on_body_entered(body: PhysicsBody2D):
	entered = true


func _on_body_exited(body: PhysicsBody2D):
	entered = false

func _process(delta: float) -> void:
	if entered == true:
		if Input.is_action_just_pressed("left_click"):
			get_tree().change_scene_to_file("res://tscn_files/main_scene.tscn")
		
