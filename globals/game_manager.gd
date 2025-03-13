extends Node

const MAIN = preload("res://scenes/main/main.tscn")
const GAME = preload("res://scenes/game/game.tscn")

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)
