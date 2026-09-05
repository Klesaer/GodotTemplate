extends Node
class_name HealthComponent

signal on_health_changed(curr_health: float)
signal on_dead

var max_health: float
var curr_health: float
@export var is_invinsible: bool = false

func setup(value: float) -> void:
	max_health=value
	curr_health=value
	
func take_damage(value: float) -> void:
	print("take_damage called, value=", value, " curr_health(before)=", curr_health)
	if curr_health <=0:
		on_dead.emit()
		return
		
	curr_health=max(curr_health-value,0)
	on_health_changed.emit(curr_health)
	print("emitted on_health_changed with ", curr_health)
	EventBus.on_player_health_updated.emit(curr_health, max_health)

func heal(value: float) -> void:
	curr_health += value
	curr_health = min(curr_health, max_health)
	on_health_changed.emit(curr_health)
	print("emitted on_health_changed with ", curr_health)
	EventBus.on_player_health_updated.emit(curr_health, max_health)
