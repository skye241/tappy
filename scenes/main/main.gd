extends Control


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fly") and not event.is_echo():
		GameManager.load_game_scene()

func _ready() -> void:
	get_tree().paused = false
