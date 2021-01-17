class_name BT_Z_closest_body_as_target
extends BTNode

func _do(memory : Memory) -> int:
	var p_closest_body_on_sight : Character = find_closest_body_on_sight(memory)
	
	if not p_closest_body_on_sight:
		return FAILED
	
	if p_closest_body_on_sight != memory.p_target_on_sight:
		memory.p_target_on_sight = p_closest_body_on_sight
	
	return FAILED


func find_closest_body_on_sight(memory : Memory) -> Character:
	var p_closest_body_on_sight : Character = null
	for b in memory.p_bodies_on_sight:
		if not p_closest_body_on_sight:
			p_closest_body_on_sight = b
		else:
			if memory.p_owner.global_position.distance_squared_to(b.global_position) < memory.p_owner.global_position.distance_squared_to(p_closest_body_on_sight.global_position):
				p_closest_body_on_sight = b
	return p_closest_body_on_sight
