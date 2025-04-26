extends NodeState

@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

var direction: Vector2

func _on_physics_process(_delta: float) -> void:
	GameInputEvents.update_inputs() 
	var direction = GameInputEvents.movement_input() 

	if direction.y < 0:
		animated_sprite_2d.play("idle_back")
	elif direction.x > 0:
		animated_sprite_2d.play("idle_right")
	elif direction.y > 0:
		animated_sprite_2d.play("idle_front")
	elif direction.x < 0:
		animated_sprite_2d.play("idle_left")
	else:
		animated_sprite_2d.play("idle_front")

func _on_next_transitions() -> void:
	GameInputEvents.update_inputs()
	direction = GameInputEvents.movement_input()


	if GameInputEvents.is_slashing:
		transition.emit("Slash")
	elif GameInputEvents.is_jumping:
		transition.emit("Jump")
	elif GameInputEvents.is_movement_input():
		transition.emit("Walk")
