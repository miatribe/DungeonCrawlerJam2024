extends Node3D


signal Interacted()

var open:bool = false

@onready var lever_left: MeshInstance3D = $Lever_Left


func interact() -> void:
	if !open:
		lever_left.rotation_degrees.y += 180
		open = true
		Interacted.emit()
		#door.position.y = 3
