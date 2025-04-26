extends NodeState

@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

func _on_enter() -> void:
	GameInputEvents.update_inputs()
	var direction = GameInputEvents.movement_input()

	if direction.y < 0:
		animated_sprite_2d.play("backslash_back")
	elif direction.x > 0:
		animated_sprite_2d.play("backslash_right")
	elif direction.y > 0:
		animated_sprite_2d.play("backslash_front")
	elif direction.x < 0:
		animated_sprite_2d.play("backslash_left")
	else:
		animated_sprite_2d.play("backslash_front") 

func _on_physics_process(_delta: float) -> void:
	pass

func _on_next_transitions() -> void:
	if !Input.is_action_pressed("slash"):
		transition.emit("Idle")

func _on_exit() -> void:
	pass
