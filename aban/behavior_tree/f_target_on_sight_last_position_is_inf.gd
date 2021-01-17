class_name BT_F_target_on_sight_last_position_is_inf
extends BTNode


func _do(memory : Memory) -> int:
	if memory.p_target_on_sight_last_position.global_position == Vector2.INF:
		return OK
	return FAILED
