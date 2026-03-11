extends CharacterBody2D
@onready var wall: AudioStreamPlayer2D = $wall
@onready var score: AudioStreamPlayer2D = $score
@onready var paddle_hit: AudioStreamPlayer2D = $paddle_hit

var win_size: Vector2
const START_SPEED: int = 500
const ACCEL: int = 50
var speed: int
var dir: Vector2
const max_y_vector: float = 0.6

func _ready() -> void:
	win_size = get_viewport_rect().size
	
func new_ball():
	position.x = win_size.x /2
	position.y = randf_range(200, win_size.y - 200)
	speed = START_SPEED
	dir = random_direction()
	
func random_direction():
	var new_dir = Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(dir * speed * delta)
	var collider: Variant
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player" or collider == $"../CPU":
			speed += ACCEL
			dir = new_direction(collider)
			paddle_hit.play()
		else:
			dir = dir.bounce(collision.get_normal())
			wall.play()

func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
		
	new_dir.y = (dist / (collider.p_height / 2)) * max_y_vector
	return new_dir.normalized()
	
		
