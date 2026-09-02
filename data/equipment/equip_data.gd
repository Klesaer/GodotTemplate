extends ItemData
class_name EquipData

enum EquipType {
	Helmet, Chest, Legs, Weapon, Ring
}

@export var equip_type: EquipType

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
