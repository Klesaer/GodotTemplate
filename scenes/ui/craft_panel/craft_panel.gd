extends Control
class_name CraftPanel

@export var recipies: Array[CraftData]

@onready var container: GridContainer = %Container
@onready var materials_container: VBoxContainer = %MaterialsContainer

@onready var material_1_icon: TextureRect = %Material1Icon
@onready var material_1_name: Label = %Material1Name
@onready var material_1_qty: Label = %Material1Qty

@onready var material_2_icon: TextureRect = %Material2Icon
@onready var material_2_name: Label = %Material2Name
@onready var material_2_qty: Label = %Material2Qty

@onready var amount_label: Label = %AmountLabel

func _on_close_button_pressed() -> void:
	pass # Replace with function body.
