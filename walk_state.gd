extends NodeState

@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 100

func _on_physics_process(_delta: float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()

	if direction.y < 0:
		animated_sprite_2d.play("walk_up")
	elif direction.x > 0:
		animated_sprite_2d.play("walk_right")
	elif direction.y > 0:
		animated_sprite_2d.play("walk_down")
	elif direction.x < 0:
		animated_sprite_2d.play("walk_left")

	player.velocity = direction * speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	GameInputEvents.update_inputs()
	var direction = GameInputEvents.movement_input() 

	if GameInputEvents.is_slashing:
		transition.emit("Slash")
	elif GameInputEvents.is_jumping:
		transition.emit("Jump")
	elif !GameInputEvents.is_movement_input():
		transition.emit("Idle")
