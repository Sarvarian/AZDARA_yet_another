class_name BT_F_look_state_is_custom_position
extends BTNode


func _do(memory : Memory) -> int:
	if memory.p_look_state == Gl.look_custom_position:
		return OK
	return FAILED
