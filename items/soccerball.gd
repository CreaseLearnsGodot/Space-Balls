extends RigidBody2D

func _on_SoccerBall_body_entered(body):
	if body.name == ("Player"):
	 ($BallKicked).play()
