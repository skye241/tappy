extends Node

const MAIN = preload("res://scenes/main/main.tscn")
const GAME = preload("res://scenes/game/game.tscn")
const SIMPLE_TRANSITION = preload("res://scenes/transition/simple_transition.tscn")
const COMPLEX_TRANSITION = preload("res://scenes/transition/complex_transition.tscn")

var next_scene: PackedScene

func add_complex() -> void:
	var ct = COMPLEX_TRANSITION.instantiate()
	add_child(ct)

func load_game_scene() -> void:
	next_scene = GAME
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)

func load_main_scene() -> void:
	next_scene = MAIN
	add_complex()
	#get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
