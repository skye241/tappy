extends Node2D

const PIPES = preload("res://scenes/pipes/pipes.tscn")

@onready var plane: Tappy = $Plane
@onready var timer: Timer = $Timer
@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point: Marker2D = $LowerPoint
@onready var pipes_holder: Node = $PipesHolder

func _ready() -> void:
	spawn_pipe()

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(game_over)
	


func spawn_pipe() -> void:
	var new_pipe = PIPES.instantiate()
	var ypos : float = randf_range(upper_point.position.y, lower_point.position.y)
	new_pipe.position = Vector2(get_viewport_rect().size.x + 50,  ypos)
	pipes_holder.add_child(new_pipe)
	
func _on_timer_timeout() -> void:
	spawn_pipe() # Replace with function body.

func game_over() -> void:
	get_tree().paused = true
	
	
