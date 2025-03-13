extends Node2D

class_name Pipes
const SPEED: float = 120.0
const OFF_SCREEN: float = 100.0
@onready var laser: Area2D = $Laser

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= SPEED * delta
	if position.x < get_viewport_rect().position.x - OFF_SCREEN:
		die()
	
func die() -> void:
	set_process(false)
	queue_free()

func _on_screen_exited() -> void:
	die()


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die() # Replace with function body.


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		SignalHub.emit_on_point_score() # Replace with function body.
