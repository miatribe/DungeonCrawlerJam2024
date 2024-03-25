extends HBoxContainer

@export var PartyMemberPanel: PackedScene
@export var PartyMembers: Array[PartyMember]

signal AttackMade(range:int,damage:int)
signal Interact()

func _ready() -> void:
	for pm in PartyMembers:
		var member = PartyMemberPanel.instantiate()
		member.partyMember = pm
		member.connect("ActionRaised",on_party_member_action)
		add_child(member)


func on_party_member_action(action:Action) -> void:
	match action.action_type:
		Action.actionType.attack:
			AttackMade.emit(action.cellRange,action.damage)
		Action.actionType.interact:
			Interact.emit()
		Action.actionType.heal:
			var pmWithLowestHP = PartyMembers[0]
			for pm in PartyMembers:
				if pm.maxHealth -pm.currentHealth > pmWithLowestHP.maxHealth - pmWithLowestHP.currentHealth:
					pmWithLowestHP = pm
			pmWithLowestHP.currentHealth += action.healAmount
