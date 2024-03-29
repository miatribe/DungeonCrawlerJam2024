extends Node3D


func _on_start_game_button_pressed() -> void:
	get_tree().paused = false
	var level1 = load("res://Scenes/Levels/level_one.tscn")
	get_tree().change_scene_to_packed(level1)


func _on_non_web_button_pressed() -> void:
	get_tree().quit()
