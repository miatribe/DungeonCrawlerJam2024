extends Node3D
class_name Crawler

@warning_ignore("unused_signal")
signal damage_recevied(damage:int)

@export var cell_size:int = 2

@onready var ray_foward: RayCast3D = $MidPointMarker/RayFoward
@onready var ray_backward: RayCast3D = $MidPointMarker/RayBackward
@onready var ray_left: RayCast3D = $MidPointMarker/RayLeft
@onready var ray_right: RayCast3D = $MidPointMarker/RayRight
@onready var input_delay: Timer = $InputDelay
@onready var shape_cast_3d: ShapeCast3D = $MidPointMarker/ShapeCast3D


func _ready() -> void:
	set_process_input(false)
	await get_tree().create_timer(1).timeout
	set_process_input(true)


func _input(event: InputEvent) -> void:
	if input_delay.is_stopped():
		if event.is_action_pressed("MoveFoward") && !ray_foward.is_colliding():
			position += (transform.basis * Vector3.FORWARD) * cell_size
			input_delay.start()
		if event.is_action_pressed("MoveBackward") && !ray_backward.is_colliding():
			position += (transform.basis * Vector3.BACK) * cell_size
			input_delay.start()
		if event.is_action_pressed("StrafeLeft") && !ray_left.is_colliding():
			position += (transform.basis * Vector3.LEFT) * cell_size
			input_delay.start()
		if event.is_action_pressed("StrafeRight") && !ray_right.is_colliding():
			position += (transform.basis * Vector3.RIGHT) * cell_size
			input_delay.start()
		if event.is_action_pressed("TurnLeft"):
			rotation_degrees.y += 90
		if event.is_action_pressed("TurnRight"):
			rotation_degrees.y -= 90


func attack(cellRange:int,damage:int) -> void:
	var collider = get_interacable_object(cellRange,2)
	if collider:
		if collider.has_method("take_damage"):
			collider.take_damage(damage)


func interact() -> void:
	var collider = get_interacable_object(0,4)
	if collider:
		if collider.has_method("interact"):
			collider.interact()


func get_interacable_object(cellRange:int,collisionMask:int) -> Node:
	shape_cast_3d.target_position = Vector3.FORWARD * cellRange
	shape_cast_3d.force_shapecast_update()
	if shape_cast_3d.collision_result.size() > 0:
		print(shape_cast_3d.collision_result[0].collider)
		if shape_cast_3d.collision_result[0].collider.get_collision_layer() == collisionMask:
			return shape_cast_3d.collision_result[0].collider.get_parent()
	return null
