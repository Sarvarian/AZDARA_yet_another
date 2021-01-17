class_name Paths
extends Object


const GAME : String = "res://aban/game/game.tscn"
const PLAYER : String = "res://aban/player/player.tscn"
const AI : String = "res://aban/ai/ai.tscn"



static func map(name : String) -> String:
	return "res://contents/maps/%s.tscn/" % [name]
	pass


static func character(name : String) -> String:
	return "res://contents/characters/%s.tscn/" % [name]
	pass


static func weapon(name : String) -> String:
	return "res://contents/weapons/%s.tscn/" % [name]
	pass
