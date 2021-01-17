class_name BT_T_set_look_state_on_forward
extends BTNode

func _do(memory : Memory) -> int:
	
	memory.p_look_state = Gl.look_forward
	
	return OK
