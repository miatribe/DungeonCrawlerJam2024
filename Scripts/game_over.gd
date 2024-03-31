extends Control


func _ready() -> void:
	visible = false


func on_game_over() -> void:
	get_tree().paused = true
	visible = true


func on_game_victory() -> void:
	$VBoxContainer/Title.text = "Thank you for playing!"
	$VBoxContainer/Message.text = "Michael, Preston, and Nathan safely made it home. No one would believe their other-worldly story."
	get_tree().paused = true
	visible = true


func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	var level1 = load("res://Scenes/Levels/level_one.tscn")
	get_tree().change_scene_to_packed(level1)


func _on_exit_button_pressed() -> void:
	get_tree().quit()
