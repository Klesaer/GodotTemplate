extends ItemData
class_name EquipData

enum EquipType {
	Helmet, Chest, Legs, Weapon, Ring
}

@export var equip_type: EquipType
@export var bonus_damage : float = 0.0
#@export var bonus_health : float = 0.0
#@export var bonus_mana : float = 0.0
#@export var bonus_speed : float = 0.0

func _init() -> void:
	# if the item is equipment, then modify those data fields by default.
	type = Type.EQUIPMENT
	max_stack = 1

func get_equip_key() -> String:
	match equip_type:
		EquipType.Helmet: return "helmet"
		EquipType.Chest: return "chest"
		EquipType.Legs: return "legs"
		EquipType.Weapon: return "weapon"
		EquipType.Ring: return "ring"
	return ""
