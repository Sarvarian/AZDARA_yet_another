class_name BT_F_look_state_is_target
extends BTNode


func _do(memory : Memory) -> int:
	if memory.p_look_state == Gl.look_target:
		return OK
	return FAILED
