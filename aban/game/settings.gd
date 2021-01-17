class_name GameSettings
extends Object


var name : String = "Main"
var map_name : String = ""
var players_saves_profiles : Array = []


func _notification(what : int) -> void:
	if what == NOTIFICATION_PREDELETE:
		for psp in players_saves_profiles:
			psp.free()
	pass


func new_player_save_profile(
	id : int = 0,
	character : String = "default"
	) -> void:
	
	var psp : PlayerSaveProfile = PlayerSaveProfile.new()
	psp.character = character
	psp.id = id
	
	players_saves_profiles.append(psp)
	
	pass

