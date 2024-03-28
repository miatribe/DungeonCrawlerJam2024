extends Control


func _ready() -> void:
	visible = false


func on_game_over() -> void:
	get_tree().paused = true
	visible = true


func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	var level1 = load("res://Scenes/Levels/level_one.tscn")
	get_tree().change_scene_to_packed(level1)


func _on_exit_button_pressed() -> void:
	get_tree().quit()
