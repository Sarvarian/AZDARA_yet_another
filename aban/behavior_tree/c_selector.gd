class_name BT_C_Selector
extends BTNode


func _do(memory : Memory) -> int:
	
	for c in get_children():
		if (c as BTNode)._do(memory) == OK:
			return OK
	
	return FAILED
