extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://tscn_files/main_scene.tscn")
		
func _on_exit_pressed() -> void:
	get_tree().quit()
