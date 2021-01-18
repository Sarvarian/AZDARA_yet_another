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


func disable_collision() -> void:
	$Arm/hand/Weapon/CollisionShape2D.set_disabled(true)
	pass


func enable_collision() -> void:
	$Arm/hand/Weapon/CollisionShape2D.set_disabled(false)
	pass



