extends Area2D
class_name Enemy

signal on_enemy_died

@export var max_health: float = 10.0
@export var damage: float = 10.0
@export var exp_amount: float = 10.0

@onready var selector: Sprite2D = $Selector
@onready var health_component: HealthComponent = $HealthComponent
@onready var fsm: FSM = $FSM
@onready var anim_sprite: AnimatedSprite2D = $AnimSprite



var enemy_zone: EnemyZone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_component.setup(max_health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fsm.curr_state:
		fsm.curr_state.process_state(delta)

func update_animation(dir: Vector2) -> void:
	if abs(dir.x) > abs(dir.y):
		if dir.x > 0:
			anim_sprite.play("move_right")
		else:
			anim_sprite.play("move_left")
	else:
		if dir.y > 0:
			anim_sprite.play("move_down")
		else:
			anim_sprite.play("move_up")

func select_enemy() -> void:
	selector.show()
	

func deselect_enemy() -> void:
	selector.hide()
