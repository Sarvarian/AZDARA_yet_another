extends Node


var memory : Memory


func _process(_delta : float) -> void:
	find_bodies_on_sight()
	clear_target_on_sight()
	set_target_on_sight_last_position()
	pass


func _on_Sight_body_entered(body : Node) -> void:
	if body == memory.p_owner: return
	if not body is Character: return
	if not memory.p_bodies_on_sight_area.has(body):
		memory.p_bodies_on_sight_area.append(body)
	pass


func _on_Sight_body_exited(body : Node) -> void:
	if memory.p_bodies_on_sight_area.has(body):
		memory.p_bodies_on_sight_area.erase(body)
	pass


func find_bodies_on_sight() -> void:
	memory.p_bodies_on_sight.clear()
	for b in memory.p_bodies_on_sight_area:
		$"../RayCast".set_global_rotation(0)
		$"../RayCast".set_cast_to(b.global_position - memory.p_owner.global_position)
		$"../RayCast".force_raycast_update()
		if $"../RayCast".get_collider() == b:
			memory.p_bodies_on_sight.append(b)
	pass


func clear_target_on_sight() -> void:
	if memory.p_target_on_sight:
		if not memory.p_bodies_on_sight.has(memory.p_target_on_sight):
			memory.p_target_on_sight = null
	pass


func set_target_on_sight_last_position() -> void:
	if memory.p_target_on_sight:
		memory.p_target_on_sight_last_position.global_position = memory.p_target_on_sight.global_position
	pass

