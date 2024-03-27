extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var player = get_tree().get_first_node_in_group("player");
@onready var ray_cast_3d: RayCast3D = $RayCast3D

var aggressed := false
var dead := false
@export var attackDamage:= 30

var health:= 30:
	set(new_hp):
		health = new_hp
		if health <= 0:
			dead = true
			animation_player.play("Death")


func _process(delta: float) -> void:
	if dead: return
	if aggressed:
		navigation_agent_3d.target_position = player.global_position


func _physics_process(delta: float) -> void:
	if dead: return
	if aggressed && !ray_cast_3d.is_colliding():
		animation_player.play("Walk")
		var next_position = navigation_agent_3d.get_next_path_position()
		var direction = global_position.direction_to(next_position)
		var next_pos_no_y = direction
		next_pos_no_y.y = 0
		look_at(global_position + next_pos_no_y, Vector3.UP,false)
		position += (transform.basis * Vector3.FORWARD) * delta * 2
	elif aggressed:
		animation_player.play("Sword")


func take_damage(damage:int) -> void:
	aggressed = true
	health -= damage
	if !dead:
		animation_player.play("HitReact")


func die() -> void:
	queue_free()


func attack() -> void:
	if ray_cast_3d.is_colliding():
		var colliderParent = ray_cast_3d.get_collider().get_parent()
		if colliderParent is Crawler:
			colliderParent.damage_recevied.emit(attackDamage)
