extends Control
@onready var high_score_label: Label = $MarginContainer/HighScoreLabel


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fly") and not event.is_echo():
		GameManager.load_game_scene()

func _ready() -> void:
	high_score_label.text = "%04d" % ScoreManager.high_score
	get_tree().paused = false
