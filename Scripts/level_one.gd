extends Node


@export var dialogs: Array[Dialog]

@onready var party_member_list: HBoxContainer = $PartyMemberList
@onready var dialog_container: MarginContainer = $DialogContainer


func _ready() -> void:
	for pm in party_member_list.PartyMembers:
		pm.currentHealth = pm.maxHealth
 

func _on_dialog_0_trigger_triggered() -> void:
	dialog_container.dialog = dialogs[0]


func _on_dialog_1_trigger_triggered() -> void:
	dialog_container.dialog = dialogs[1]


func _on_lever_left_2_interacted() -> void:
	$Props/WallOnly2.position.y = 3
	dialog_container.dialog = dialogs[2]


func _on_dialog_2_trigger_triggered() -> void:
	dialog_container.dialog = dialogs[3]


func _on_skeleton_death() -> void:
	dialog_container.dialog = dialogs[4]


func _on_skeleton_3_death() -> void:
	dialog_container.dialog = dialogs[5]


func _on_fox_room_lock_trigger_triggered() -> void:
	$Props/WallOutOfFoxRoom.position.y = 1


func _on_dialog_6_trigger_triggered() -> void:
	dialog_container.dialog = dialogs[6]


func _on_dialog_7_trigger_triggered() -> void:
	dialog_container.dialog = dialogs[7]


func _on_dialog_8_trigger_triggered() -> void:
	dialog_container.dialog = dialogs[8]


func _on_fox_interacted() -> void:
	if $Triggers/Dialog6Trigger:
		$Triggers/Dialog6Trigger.queue_free()
	dialog_container.dialog = dialogs[9]
	$Props/WallToPortal.position.y = 3 


func _on_portal_trigger_triggered() -> void:
	var level2 = load("res://Scenes/Levels/level_two.tscn")
	get_tree().change_scene_to_packed(level2)





