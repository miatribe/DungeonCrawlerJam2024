extends Node3D

@export var door:Node3D
@onready var lever_left: MeshInstance3D = $Lever_Left

var open:bool = false

func interact() -> void:
	if !open:
		lever_left.rotation_degrees.y += 180
		open = true
		door.position.y = 3
