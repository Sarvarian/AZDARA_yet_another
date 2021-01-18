class_name BT_Z_frontest_open_dir_as_persist_move_dir
extends BTNode

func _do(memory : Memory) -> int:
	for w in memory.p_owner.l_shoulder.get_children():
		(w as Weapon).disable_collision()
	for w in memory.p_owner.r_shoulder.get_children():
		(w as Weapon).disable_collision()
	
	var desirable_dir : Vector2 = frontest_open_dir(memory.p_owner)
	
	for w in memory.p_owner.l_shoulder.get_children():
		(w as Weapon).enable_collision()
	for w in memory.p_owner.r_shoulder.get_children():
		(w as Weapon).enable_collision()
	
	if memory.d_move_dir == desirable_dir:
		return FAILED
	
	memory.d_move_dir = desirable_dir
	return OK


static func frontest_open_dir(
	character : Character,
	motion_test_length : int = 250,
	motion_test_degrees : int = 30
	) -> Vector2:
	
	var dir : Vector2 = Vector2.RIGHT.rotated(character.global_rotation)
# warning-ignore:integer_division
	var size : int = 360 / motion_test_degrees
	var rot : float = 0
	
	if motion_test(character, rot, motion_test_length): return dir
	
# warning-ignore:integer_division
	for i in (size/2):
		rot = deg2rad(motion_test_degrees * (i+1))
		if motion_test(character, rot, motion_test_length): return dir.rotated(rot)
		rot = deg2rad(motion_test_degrees * -(i+1))
		if motion_test(character, rot, motion_test_length): return dir.rotated(rot)
	
# warning-ignore:integer_division
	rot = deg2rad(motion_test_degrees * (size/2))
	if motion_test(character, rot, motion_test_length): return dir.rotated(rot)
	
	return Vector2.ZERO
	
	pass


static func motion_test(
	character : Character,
	rotation : float,
	motion_test_length : int
	) -> bool:
	
	rotation = character.global_rotation + rotation
	var motion : Vector2 = Vector2.RIGHT.rotated(rotation) * motion_test_length
	return not character.test_motion(motion, false)
	
	pass
