class_name AI
extends Node2D


export(NodePath) var behavior_tree_path : NodePath

var behavior_tree : BTNode
onready var memory : Memory = $Memory


func _ready() -> void:
	if not behavior_tree:
		behavior_tree = get_node(behavior_tree_path)
	$Perception.memory = memory
	$RayCast.add_exception(memory.c_owner)
	$Empty/TargetOnSightLastPosition.global_position = Vector2.INF
	$Empty/CustomLookPosition.global_position = Vector2.INF
	pass


func _physics_process(delta : float) -> void:
	move(delta)
	memory.p_look_state._act(
		memory.c_owner,
		memory.c_target_on_sight_last_position,
		memory.c_custom_look_position,
		delta
		)
	pass


#func _process(_delta : float) -> void:
#	pass


func _on_Timer_timeout():
# warning-ignore:return_value_discarded
	behavior_tree._do(memory)
	pass


func move(delta : float) -> void:
	if memory.d_move_dir:
		if memory.d_move_dir.length_squared() > 1:
			memory.d_move_dir = memory.d_move_dir.normalized()
		memory.c_owner.apply_central_impulse(memory.d_move_dir * memory.c_owner.move_speed * delta)
	pass
