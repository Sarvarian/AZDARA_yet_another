class_name Game
extends Node


var settings : GameSettings
var map : Map


func _ready() -> void:
	if not settings:
		Msg.ne(self, "GameSettings is NULL!")
		queue_free()
		return
	
	var map_res = load(Paths.map(settings.map_name))
	if not map_res:
		Msg.ne(self, "Map named \"%s\" connot load!"%settings.initial_map_name)
		queue_free()
		return
	
	map = map_res.instance() as Map
	if not map:
		Msg.ne(self, "Resource named \"%s\" is not \"Map\" type.")
		queue_free()
		return
	
	$Map.add_child(map)
	
	for i in settings.players_saves_profiles.size():
		var psp : PlayerSaveProfile = settings.players_saves_profiles[i] as PlayerSaveProfile
		var character : Character = load(Paths.character(psp.character)).instance()
		var player : Player = load(Paths.PLAYER).instance()
		var ai : AI = load(Paths.AI).instance()
		ai.behavior_tree = $PlayerBT
		player.id = psp.id
		player.ai = ai
		player.add_child(ai)
		character.add_child(player)
		character.global_position = map.start_point.global_position
		character.global_rotation = map.start_point.global_rotation
		$Players.add_child(character)
	
	pass


func _exit_tree() -> void:
	settings.free()
	pass
