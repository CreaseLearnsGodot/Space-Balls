extends '../state.gd'

func handle_input(host, event):
	if event.is_action_pressed('simulate_damage'):
		return 'stagger'

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("move_right"))
	input_direction.y = int(Input.is_action_pressed("move_down"))
	return input_direction
	
func update_look_direction(host, direction):
	if direction and host.look_direction != direction:
		host.look_direction = direction
	if not direction.x in [-1, 1]:
		return
	host.get_node('BodyPivot').set_scale(Vector2(direction.x, 1))