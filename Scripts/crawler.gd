extends Node3D
class_name Crawler

@onready var ray_foward: RayCast3D = $MidPointMarker/RayFoward
@onready var ray_backward: RayCast3D = $MidPointMarker/RayBackward
@onready var ray_left: RayCast3D = $MidPointMarker/RayLeft
@onready var ray_right: RayCast3D = $MidPointMarker/RayRight
@onready var input_delay: Timer = $InputDelay

@export var cell_size:int = 2


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
