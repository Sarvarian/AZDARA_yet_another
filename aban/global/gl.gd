extends Node


var look_none : LookState = LookState.new()
var look_forward : LookState = LookForward.new()
var look_target : LookState = LookTarget.new()
var look_custom_position : LookState = LookCustomPosition.new()


func _exit_tree() -> void:
	look_none.free()
	look_forward.free()
	look_target.free()
	look_custom_position.free()
	pass
