extends Item
class_name ItemData

enum Type{
	FOOD, ORE, POTION, SCROLL, EQUIPMENT
	
}

@export var type: Type
@export var is_consumerable: bool
@export var max_stack: int = 64
