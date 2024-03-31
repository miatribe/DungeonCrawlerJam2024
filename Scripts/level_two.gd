extends Node


@export var dialogs: Array[Dialog]

@onready var party_member_list: HBoxContainer = $PartyMemberList
@onready var dialog_container: MarginContainer = $DialogContainer

 
func _on_tenticle_one_tenticle_death() -> void:
	$Props/FirstWall.position.y = 3 
	if $Triggers/Trigger3:
		$Triggers/Trigger3.queue_free()



func _on_tenticle_one_3_tenticle_death() -> void:
	$Props/Portal.visible = true
	$Triggers/VictoryTrigger.visible = true
	dialog_container.dialog = dialogs[6]

func _on_tenticle_one_2_tenticle_death() -> void:
	if $Triggers/Trigger5:
		$Triggers/Trigger5.queue_free()
	$Props/SecondWall.position.y = 3 


func _on_trigger_triggered() -> void:
	dialog_container.dialog = dialogs[0]


func _on_trigger_2_triggered() -> void:
	dialog_container.dialog = dialogs[1]


func _on_trigger_4_triggered() -> void:
	dialog_container.dialog = dialogs[2]


func _on_trigger_3_triggered() -> void:
	dialog_container.dialog = dialogs[3]


func _on_trigger_5_triggered() -> void:
	dialog_container.dialog = dialogs[4]


func _on_trigger_6_triggered() -> void:
	dialog_container.dialog = dialogs[5]
