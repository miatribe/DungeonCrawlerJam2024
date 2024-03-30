extends Node


@export var dialogs: Array[Dialog]

@onready var party_member_list: HBoxContainer = $PartyMemberList
@onready var dialog_container: MarginContainer = $DialogContainer

 
func _on_tenticle_one_tenticle_death() -> void:
	$Props/FirstWall.position.y = 3 
	#dialog_container.dialog = dialogs[0]
