extends PanelContainer

@onready var name_label: Label = $VBoxContainer/NameLabel
@onready var member_icon: TextureRect = $VBoxContainer/HBoxContainer/MemberIcon
@onready var health_bar: ProgressBar = $VBoxContainer/HealthBar
@onready var action_1: Button = $VBoxContainer/HBoxContainer/VBoxContainer/Action1
@onready var action_2: Button = $VBoxContainer/HBoxContainer/VBoxContainer/Action2
@onready var action_1_cooldown: Timer = $Action1Cooldown
@onready var action_2_cooldown: Timer = $Action2Cooldown

signal ActionRaised(Action)

var partyMember: PartyMember


func _ready() -> void:
	name_label.text = partyMember.name
	member_icon.texture = partyMember.image
	health_bar.max_value = partyMember.maxHealth
	health_bar.value = partyMember.currentHealth
	partyMember.connect("HealthChanged", func():health_bar.value = partyMember.currentHealth)
	if partyMember.action_1:
		action_1_cooldown.wait_time = partyMember.action_1.cooldownTime
		action_1.text = partyMember.action_1.actionName
	if partyMember.action_2:
		action_2_cooldown.wait_time = partyMember.action_2.cooldownTime
		action_2.text = partyMember.action_2.actionName


func _on_action_1_pressed() -> void:
	if partyMember.action_1:
		actionPressed(partyMember.action_1)


func _on_action_2_pressed() -> void:
	if partyMember.action_2:
		actionPressed(partyMember.action_2)


func actionPressed(action:Action) -> void:
	if action.action_type == Action.actionType.heal && action.targetMemberIndex == -1:
		partyMember.currentHealth += action.healAmount
	else:
		ActionRaised.emit(action)
