class_name BT_F_target_on_sight
extends BTNode


func _do(memory : Memory) -> int:
	if memory.p_target_on_sight:
		return OK
	return FAILED
