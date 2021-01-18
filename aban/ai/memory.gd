class_name Memory
extends Node


var c_owner : Character setget ,get_c_owner
var c_target_on_sight_last_position : Position2D setget ,get_c_target_on_sight_last_position
var c_custom_look_position : Position2D setget ,get_c_custom_look_position

var p_bodies_on_sight_area : Array = []
var p_bodies_on_sight : Array = []
var p_target_on_sight : Character = null
var p_look_state : LookState = Gl.look_none
var p_target_position : Position2D 

var d_move_dir : Vector2 = Vector2.ZERO


func _enter_tree() -> void:
	var character : Node = get_parent().get_parent()
	if not character is Character:
		character = character.get_parent()
	c_owner = character as Character
	c_target_on_sight_last_position = $"../Empty/TargetOnSightLastPosition"
	c_custom_look_position = $"../Empty/CustomLookPosition"
	pass


func get_c_owner() -> Character:
	return c_owner


func get_c_target_on_sight_last_position() -> Position2D:
	return c_target_on_sight_last_position


func get_c_custom_look_position() -> Position2D:
	return c_custom_look_position

