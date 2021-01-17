class_name BT_D_Not
extends BTNode


func _do(memory : Memory) -> int:
	if (get_child(0) as BTNode)._do(memory) == OK:
		return FAILED
	return OK
