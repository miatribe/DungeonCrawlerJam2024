extends Area3D


signal Triggered()

@export var triggerOnArea:= 4


func _on_area_entered(area: Area3D) -> void:
	if area.get_collision_layer_value(triggerOnArea):
		Triggered.emit()
		queue_free()
		
