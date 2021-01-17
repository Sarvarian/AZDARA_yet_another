extends Node


func _ready() -> void:
	var gs : GameSettings = GameSettings.new()
	gs.name = "test_game"
	gs.map_name = "test"
	gs.new_player_save_profile(0, "player_test")
	var game : Game = load(Paths.GAME).instance()
	game.settings = gs
	add_child(game)
	
	pass


func _input(event : InputEvent) -> void:
	if event.is_action_released("quit"):
		get_tree().quit()
	
	pass
