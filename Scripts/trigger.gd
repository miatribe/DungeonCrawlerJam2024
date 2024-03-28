extends Area3D


signal Triggered()


func _on_area_entered(_area: Area3D) -> void:
	Triggered.emit()
	queue_free()
