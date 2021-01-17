class_name Memory
extends Node


var p_owner : Character
var p_target_on_sight_last_position : Position2D
var p_custom_look_position : Position2D
var p_bodies_on_sight_area : Array = []
var p_bodies_on_sight : Array = []
var p_target_on_sight : Character = null
var p_look_state : LookState = Gl.look_none

var d_move_dir : Vector2 = Vector2.ZERO
