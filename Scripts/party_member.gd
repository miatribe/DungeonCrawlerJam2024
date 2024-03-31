extends Resource
class_name PartyMember


signal HealthChanged()

@export var name:String
@export var image: Texture
@export var maxHealth: int
@export var currentHealth:int:
	set(hp_in):
		currentHealth = clampi(hp_in,0,maxHealth)
		HealthChanged.emit()
@export var action_1:Action
@export var action_2:Action
