class_name Weapon
extends Position2D


func _ready() -> void:
	released()
	pass


func pressed() -> void:
	$AnimationPlayer.play("Pressed")
	pass


func released() -> void:
	$AnimationPlayer.play("Released")
	pass
