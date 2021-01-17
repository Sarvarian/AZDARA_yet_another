class_name Player
extends Node2D


var ai : AI
var id : int = 0

onready var camera : Camera2D = $Camera


func _ready() -> void:
	get_parent().add_to_group("Players")
	ai.memory.p_look_state = Gl.look_custom_position
	pass


func _physics_process(_delta : float) -> void:
	ai.memory.d_move_dir = Vector2.ZERO
	
	ai.memory.d_move_dir.y -= Input.get_action_strength("player%s_move_up"%id)
	ai.memory.d_move_dir.x -= Input.get_action_strength("player%s_move_left"%id)
	ai.memory.d_move_dir.y += Input.get_action_strength("player%s_move_down"%id)
	ai.memory.d_move_dir.x += Input.get_action_strength("player%s_move_right"%id)
	
	pass


func _input(event : InputEvent) -> void:
	
	if event.is_action_released("player%s_camera_zoom_in"%id):
		camera.zoom_in()
	if event.is_action_released("player%s_camera_zoom_out"%id):
		camera.zoom_out()
	
	if event.is_action_released("player%s_look_state_switch"%id):
		look_state_switch()
	
	if event.is_action_pressed("player%s_left_hand"%id):
		for c in ai.memory.p_owner.l_shoulder.get_children():
			if c is Weapon:
				c.pressed()
		pass
	
	if event.is_action_released("player%s_left_hand"%id):
		for c in ai.memory.p_owner.l_shoulder.get_children():
			if c is Weapon:
				c.released()
		pass
	
	if event.is_action_pressed("player%s_right_hand"%id):
		for c in ai.memory.p_owner.r_shoulder.get_children():
			if c is Weapon:
				c.pressed()
		pass
	
	if event.is_action_released("player%s_right_hand"%id):
		for c in ai.memory.p_owner.r_shoulder.get_children():
			if c is Weapon:
				c.released()
		pass
	
	if event.is_action_pressed("player%s_dash"%id):
		ai.memory.p_owner.dash()
		pass
	
	if id != 0: return
	if event is InputEventMouseMotion:
		ai.memory.p_custom_look_position.global_position = get_global_mouse_position()
		pass
	
	pass


func look_state_switch() -> void:
	if $LookStateSwitchTimer.is_stopped():
		if ai.memory.p_look_state == Gl.look_custom_position:
			ai.memory.p_look_state = Gl.look_forward
		else:
			ai.memory.p_look_state = Gl.look_custom_position
		$LookStateSwitchTimer.start()
	else:
		ai.memory.p_look_state = Gl.look_target
		$LookStateSwitchTimer.stop()
	pass
