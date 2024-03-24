extends PanelContainer

@onready var name_label: Label = $VBoxContainer/NameLabel
@onready var member_icon: TextureRect = $VBoxContainer/HBoxContainer/MemberIcon
@onready var health_bar: ProgressBar = $VBoxContainer/HealthBar
@onready var action_1: TextureButton = $VBoxContainer/HBoxContainer/VBoxContainer/ActionButton
@onready var action_2: TextureButton = $VBoxContainer/HBoxContainer/VBoxContainer/ActionButton2

signal ActionRaised(Action)

var partyMember: PartyMember


func _ready() -> void:
	name_label.text = partyMember.name
	member_icon.texture = partyMember.image
	health_bar.max_value = partyMember.maxHealth
	health_bar.value = partyMember.currentHealth
	partyMember.connect("HealthChanged", func():health_bar.value = partyMember.currentHealth)
	action_1.action = partyMember.action_1
	action_2.action = partyMember.action_2


func _on_action_1_pressed() -> void:
		actionPressed(partyMember.action_1)


func _on_action_2_pressed() -> void:
		actionPressed(partyMember.action_2)


func actionPressed(action:Action) -> void:
	if action.action_type == Action.actionType.heal && action.targetMemberIndex == -1:
		partyMember.currentHealth += action.healAmount
	else:
		ActionRaised.emit(action)
