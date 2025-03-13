extends Node

signal on_plane_died
signal on_point_score

func emit_on_plane_died()-> void:
	on_plane_died.emit()

func emit_on_point_score() -> void:
	on_point_score.emit()
