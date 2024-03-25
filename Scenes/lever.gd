extends Node3D

@onready var lever_left: MeshInstance3D = $Lever_Left


func interact() -> void:
	lever_left.rotation_degrees.y += 180
	print("I was interacted")
