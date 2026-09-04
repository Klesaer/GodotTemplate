extends EnemyState
class_name EnemyWanderState

@export var min_move_speed := 20.0
@export var max_move_speed := 20.0
@export var arrival_distance := 20.0

var target_pos: Vector2

func enter_state() -> void:
	pick_new_target()

func pick_new_target() -> void:
	if enemy and enemy.enemy_zone:
		target_pos = enemy.enemy_zone.get_random_pos()

func _process(delta: float) -> void:
	if not enemy: return
	
	#move to target
	var direction = enemy.global_position.direction_to(target_pos)
	var speed = randf_range(min_move_speed, max_move_speed)
	enemy.global_position += direction * speed * delta
	
	#Update the animation
	enemy.update_animation(direction)
	
	# check arrival at destination
	if enemy.global_position.distance_to(target_pos) < arrival_distance:
		pick_new_target()
	
	
