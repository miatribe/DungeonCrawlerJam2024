extends Resource
class_name Action


enum actionType{
	attack,
	interact,
	heal
}

@export var actionName:String
@export var action_type:actionType
@export var cooldownTime:float
@export var icon: Texture
#below is bad
#fields for type of attack
@export var cellRange:= 0
@export var damage:= 0
#fields for type of heal
@export var targetMemberIndex:=0
@export var healAmount:=0
