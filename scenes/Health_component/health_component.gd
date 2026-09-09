extends Node
class_name HealthComponent

signal on_health_changed(curr_health: float)
signal on_dead

var max_health: float
var curr_health: float
@export var is_invinsible: bool = false

func setup(value: float) -> void:
	max_health = value
	curr_health = value
	
func take_damage(value: float) -> void:
	if is_invinsible or curr_health <= 0.0: return
	print("take_damage called, value=", value, " curr_health(before)=", curr_health)
	curr_health = clampf(curr_health - value, 0.0, max_health)
	on_health_changed.emit(curr_health)
	
	if curr_health <=0:
		on_dead.emit()
	return

func heal(value: float) -> void:
	curr_health = clampf(curr_health + value, 0.0, max_health)
	on_health_changed.emit(curr_health)
