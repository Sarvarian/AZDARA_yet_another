extends Map


func _ready() -> void:
	$Character/LShoulder.add_child(load(Paths.weapon("dagger")).instance())
	$Character/RShoulder.add_child(load(Paths.weapon("dagger")).instance())
#	$Character2/LShoulder.add_child(load(Paths.weapon("dagger")).instance())
#	$Character2/RShoulder.add_child(load(Paths.weapon("dagger")).instance())
	pass


