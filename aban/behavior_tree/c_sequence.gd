class_name BT_C_Sequence
extends BTNode


func _do(memory : Memory) -> int:
	
	for c in get_children():
		if (c as BTNode)._do(memory) == FAILED:
			return FAILED
	
	return OK
