extends Node3D


@export var attackDamage:int = 10
@export var speed:float = 1
@export var startingHealth:int = 30

var aggressed := false
var health:= startingHealth:
	set(new_hp):
		health = new_hp
		if health <= 0:
			set_process(false)
			set_physics_process(false)
			animation_player.play("Death")
		else:
			animation_player.play("HitReact")

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var player = get_tree().get_first_node_in_group("player");
@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var agress_cast: RayCast3D = $AgressCast


func _process(_delta: float) -> void:
	if aggressed:
		navigation_agent_3d.target_position = player.global_position


func _physics_process(delta: float) -> void:
	if aggressed && !ray_cast_3d.is_colliding():
		animation_player.play("Walk")
		var next_position = navigation_agent_3d.get_next_path_position()
		var direction = global_position.direction_to(next_position)
		var next_pos_no_y = direction
		next_pos_no_y.y = 0
		look_at(global_position + next_pos_no_y, Vector3.UP,false)
		position += (transform.basis * Vector3.FORWARD) * delta * speed
	elif aggressed:
		animation_player.play("Sword")
	elif agress_cast.is_colliding() && agress_cast.get_collider().get_collision_layer() == 8:
		aggressed = true


func take_damage(damage:int) -> void:
	aggressed = true
	health -= damage


func die() -> void:
	queue_free()


func attack() -> void:
	if ray_cast_3d.is_colliding():
		var colliderParent = ray_cast_3d.get_collider().get_parent()
		if colliderParent is Crawler:
			colliderParent.damage_recevied.emit(attackDamage)
