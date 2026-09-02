extends Button
class_name EquipmentSlot

@export var equip_type: EquipData.EquipType
@onready var item_icon: TextureRect = $ItemIcom

var equipped_data: EquipData

func load_data(data: EquipData) -> void:
	equipped_data = data
	if data:
		item_icon.texture = data.icon
		item_icon.show()
	else:
		clear_slot()

func clear_slot() -> void:
	equipped_data = null
	item_icon.hide()
	
