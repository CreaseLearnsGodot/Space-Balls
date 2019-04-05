extends RigidBody2D



func _on_SoccerBall_body_entered(body):
	 ($BallKicked).play()
