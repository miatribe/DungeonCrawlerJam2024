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
	$Props/WallOnly2.position.y = 3 #Grabbing the wall to open here
	dialog_container.dialog = dialogs[2]
