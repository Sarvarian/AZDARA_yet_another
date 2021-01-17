class_name Character
extends RigidBody2D


var move_speed : int = 4000
var rot_speed : int = 100000
var dash_magnifier : int = 3

onready var l_shoulder : Position2D = $LShoulder
onready var r_shoulder : Position2D = $RShoulder


func _ready() -> void:
	add_to_group("Characters")
	pass


func dash() -> void:
	if $DashTimer.is_stopped():
		apply_central_impulse(linear_velocity * dash_magnifier)
		$DashTimer.start()
	pass
