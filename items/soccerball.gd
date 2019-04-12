extends RigidBody2D

var reset_state = false
    
func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, Vector2(1500, 750))
		reset_state = false
		state.linear_velocity = Vector2()

func _on_SoccerBall_body_entered(body):
	if body.name == ("Player"):
	 ($BallKicked).play()
	
