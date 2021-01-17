class_name LookTarget
extends LookState


static func _act(
	character : Character,
	target_on_sight_last_position : Position2D,
	_custom_look_position : Position2D,
	delta : float
	) -> void:
	
	apply_rotation(
		character,
		target_on_sight_last_position.global_position,
		delta
	)
	
	pass
