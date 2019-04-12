extends KinematicBody2D
# state_machine.gd

signal state_changed

var look_direction = Vector2(1, 0)

# navigate the stack of states available
var states_stack = []
var current_state = null

# state library, each node independent from the other
onready var states_map = {
	'idle': $States/Idle,
	'move': $States/Move,
	'jump': $States/Jump,
	'stagger': $States/Stagger,
}

func _ready():
	states_stack.push_front($States/Idle)
	current_state = states_stack[0]
	_change_state('idle')

func _physics_process(delta):
	var state_name = current_state.update(self, delta)
	if state_name:
		_change_state(state_name)
		
func _input(event):
	if event.is_action_pressed('fire'):
		pass
		
func _on_animation_finished(anim_name):
	pass

func _change_state(state_name):
	current_state.exit(self)
	
	if state_name == 'previous':
		states_stack.pop_front()
	elif state_name in ['stagger', 'jump']:
		states_stack.push_front(states_map[state_name])
	else:
		var new_state = states_map[state_name]
		states_stack[0] = new_state
	
	if state_name =='jump':
		$States/Jump.initialize(current_state.speed, current_state.velocity)
		
	current_state = states_stack[0]
	if state_name != 'previous':
		current_state.enter(self)
	emit_signal('state_changed', states_stack)
		
		
		
	## transcribed from watching and pausing a video on youtube
	## 4.11.2019 - GDQuest "Godot 3: Finite State Machine Code Example Overview"
	## url:  https://www.youtube.com/watch?v=Ty4wZL7pDME
	## this is a "state machine" to make my code WAY less complicated
	## even though right now I only half way understand it
	## now how can i use it with RigidBody2D  :P  is the question
	##
	## the idea is to have all the common things you can do like
	## (move, shoot, play anim, etc etc)
	## be completely independent from other actions/states
	## so i don't fuck up like the last few times i changed something
	## and didn't know what i did that made something stop working
	## as well as putting certain states in a logical heirarchy 
	
	
	