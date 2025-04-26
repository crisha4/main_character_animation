class_name GameInputEvents

static var direction: Vector2
static var is_jumping: bool = false
static var is_slashing: bool = false

static func movement_input() -> Vector2:
	direction = Vector2.ZERO

	if Input.is_action_pressed("walk_left"):
		direction.x = -1
	if Input.is_action_pressed("walk_right"):
		direction.x = 1
	if Input.is_action_pressed("walk_up"):
		direction.y = -1
	if Input.is_action_pressed("walk_down"):
		direction.y = 1

	direction = direction.normalized()
	
	return direction

static func update_inputs():
	is_jumping = Input.is_action_pressed("jump")
	is_slashing = Input.is_action_pressed("slash")

static func is_movement_input() -> bool:
	return direction != Vector2.ZERO
