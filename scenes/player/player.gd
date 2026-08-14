extends CharacterBody2D
class_name Player

@export_group("Stats")
@export var max_health: float = 10.0
@export var max_mana: float = 10.0
@export var move_speed: float = 60.0
@export var damage: float = 10.0
@export var crit_chance: float = 0.0
@export var crit_damage: float = 0.0

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite
@onready var fsm: FSM = $FSM


var last_direction: String = "down"

func _process(delta: float) -> void:
	if fsm.curr_state:
		fsm.curr_state.process_state(delta)
		
