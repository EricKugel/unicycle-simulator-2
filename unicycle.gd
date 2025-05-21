extends Node2D

var died = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func die() -> void:
	if not died:
		$Knee.queue_free()
		$Shoulder.queue_free()
		$Hip.queue_free()
		$Foot.queue_free()
		died = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		die()
