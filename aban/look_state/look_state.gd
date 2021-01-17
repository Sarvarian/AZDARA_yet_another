class_name LookState
extends Object


static func _act(
	_character : Character,
	_target_on_sight_last_position : Position2D,
	_custom_look_position : Position2D,
	_delta : float
	) -> void:
	
	pass


static func apply_rotation(
	character : Character,
	global_look_pos : Vector2,
	delta : float
	) -> void:
	
	var rotang : float = character.get_angle_to(global_look_pos)
	if abs(rotang) > 0.001:
		character.apply_torque_impulse(rotang * character.rot_speed * delta)
		character.set_sleeping(false)
	
	pass
