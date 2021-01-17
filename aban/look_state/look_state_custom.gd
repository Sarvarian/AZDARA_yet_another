class_name LookCustomPosition
extends LookState


static func _act(
	character : Character,
	_target_on_sight_last_position : Position2D,
	custom_look_position : Position2D,
	delta : float
	) -> void:
	
	apply_rotation(
		character,
		custom_look_position.global_position,
		delta
	)
	
	pass
