extends RigidBody2D

var torque_impulse = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _process(delta: float):
	torque_impulse = Input.get_axis("left", "right") * 700000
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	apply_torque_impulse(torque_impulse * delta)
	apply_central_impulse(Vector2(torque_impulse * delta * 0.004, 0))

	angular_velocity = clampf(angular_velocity, -10, 10)
	
	if Input.is_action_just_pressed("jump"):
		apply_central_impulse(Vector2(0, -1000))
