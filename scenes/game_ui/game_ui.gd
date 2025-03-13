extends Control

@onready var game_over: Label = $GameOver
@onready var press_space: Label = $PressSpace
@onready var timer: Timer = $Timer
@onready var score: Label = $MarginContainer/Score
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var game_over_sound: AudioStreamPlayer2D = $GameOverSound

var _score: int = 0

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(show_game_over)
	SignalHub.on_point_score.connect(on_point_score)


func _unhandled_input(event: InputEvent) -> void:
	if not game_over.visible and event.is_action_pressed("escape"):
		GameManager.load_main_scene()
	elif press_space.visible and event.is_action_pressed("fly") and not event.is_echo():
		GameManager.load_main_scene()  # Replace with function body.

func show_game_over() -> void:
	game_over_sound.play()
	game_over.show()
	timer.start()
	ScoreManager.high_score = _score

func _restart_game() -> void:
	game_over.hide()
	press_space.show()
	
func on_point_score() -> void:
	score_sound.play()
	_score +=1
	score.text = "%04d" % _score
	
