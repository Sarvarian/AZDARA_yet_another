class_name LookForward
extends LookState


static func _act(
	character : Character,
	_target_on_sight_last_position : Position2D,
	_custom_look_position : Position2D,
	delta : float
	) -> void:
	
	if not character.sleeping and character.linear_velocity.length_squared() > 10000:
		apply_rotation(
			character,
			character.global_position + character.linear_velocity,
			delta
		)
	
	pass



