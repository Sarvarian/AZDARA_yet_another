class_name BT_B_Root
extends BTNode


func _do(memory : Memory) -> int:
	
# warning-ignore:return_value_discarded
	(get_child(0) as BTNode)._do(memory)
	
	return OK
