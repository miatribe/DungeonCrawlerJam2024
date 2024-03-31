extends Node3D


signal Interacted()

var open:bool = false


func interact() -> void:
	if !open:
		open = true
		Interacted.emit()
