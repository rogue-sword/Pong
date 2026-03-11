extends RigidBody2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_speed = Vector2(200.0 * delta, 200.0 * delta)
	if  position.y >= 0 && position.y <= get_screen_transform().y.y:
		move_and_collide(movement_speed)
