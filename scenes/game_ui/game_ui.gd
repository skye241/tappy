extends Control

@onready var game_over: Label = $GameOver
@onready var press_space: Label = $PressSpace
@onready var timer: Timer = $Timer

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(show_game_over)

func _unhandled_input(event: InputEvent) -> void:
	if not game_over.visible and event.is_action_pressed("escape"):
		GameManager.load_main_scene()
	if press_space.visible and event.is_action_pressed("fly") and not event.is_echo():
		GameManager.load_main_scene()  # Replace with function body.

func show_game_over() -> void:
	game_over.show()
	timer.start()

func _restart_game() -> void:
	print('Timer done')
	game_over.hide()
	press_space.show()
	
