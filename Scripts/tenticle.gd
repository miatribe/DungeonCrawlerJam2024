extends Node3D


signal tenticle_death()

@export var attackDamage:int = 10
@export var speed:float = 1
@export var startingHealth:int = 30

var health:= startingHealth:
	set(new_hp):
		health = new_hp
		if health <= 0:
			tenticle_death.emit()
			queue_free()

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player = get_tree().get_first_node_in_group("player");
@onready var hitbox: Area3D = $Hitbox


func _physics_process(_delta: float) -> void:
	var overlaps = hitbox.get_overlapping_areas()
	if overlaps:
		animation_player.play("Tentacle_Attack2")
	else:
		animation_player.play("Tentacle_Idle")


func take_damage(damage:int) -> void:
	health -= damage


func attack() -> void:
	var overlaps = hitbox.get_overlapping_areas()
	if overlaps:
		var colliderParent = overlaps[0].get_parent()
		if colliderParent is Crawler:
			colliderParent.damage_recevied.emit(attackDamage)
