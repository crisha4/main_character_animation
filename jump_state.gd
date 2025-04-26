extends NodeState

@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var move_speed: int = 150  

var velocity: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO

func _on_enter() -> void:
	GameInputEvents.update_inputs() 
	direction = GameInputEvents.movement_input()

	if direction.y < 0:
		animated_sprite_2d.play("jump_back")
	elif direction.x > 0:
		animated_sprite_2d.play("jump_right")
	elif direction.y > 0:
		animated_sprite_2d.play("jump_front")
	elif direction.x < 0:
		animated_sprite_2d.play("jump_left")
	else:
		animated_sprite_2d.play("jump_front")
	velocity = direction * move_speed

func _on_physics_process(delta: float) -> void:
	player.velocity = velocity
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !Input.is_action_pressed("jump"):
		transition.emit("Idle") 

func _on_exit() -> void:
	pass
