class_name BT_F_look_state_is_forward
extends BTNode


func _do(memory : Memory) -> int:
	if memory.p_look_state == Gl.look_forward:
		return OK
	return FAILED
