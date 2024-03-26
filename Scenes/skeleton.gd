extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


var health:= 30:
	set(new_hp):
		health = new_hp
		if health <= 0:
			animation_player.play("Death")

func take_damage(damage:int) -> void:
	animation_player.play("HitReact")
	health -= damage


func die() -> void:
	queue_free()
