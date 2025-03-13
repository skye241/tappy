extends CharacterBody2D

class_name Tappy
#signal on_plane_died

const POWER = -200.0
const GRAVITY: float = 600.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor():
		die()
	

func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		
		
func die() -> void:
	SignalHub.on_plane_died.emit()
	animated_sprite_2d.stop()
	set_physics_process(false)
