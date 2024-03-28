extends HBoxContainer


signal AttackMade(range:int,damage:int)
signal Interact()
signal GameOver()

@export var PartyMemberPanel: PackedScene
@export var PartyMembers: Array[PartyMember]


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
			
			
func on_damage_received(damage:int) -> void:
	var pmWithHighestHP = PartyMembers[0]
	for pm in PartyMembers:
		var healthMissing = pm.maxHealth - pm.currentHealth
		if pm.currentHealth == 0: continue
		if healthMissing < pmWithHighestHP.maxHealth - pmWithHighestHP.currentHealth:
			pmWithHighestHP = pm
	print(pmWithHighestHP.name)
	pmWithHighestHP.currentHealth -= damage
	if pmWithHighestHP.currentHealth <= 0:
		GameOver.emit()
