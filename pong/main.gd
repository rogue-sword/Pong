extends Sprite2D

var score := [0, 0] # Player_score and CPU_score respectively
const  PADDLE_SPEED: int = 500


func _on_ball_timer_timeout() -> void:
	$ball.new_ball()


func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$Display/CPU_score.text = str(score[1])
	$ball_timer.start()
	$ball.score.play()
	
func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$Display/player_score.text = str(score[0])
	$ball_timer.start()
	$ball.score.play()
