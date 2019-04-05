extends "res://ships/Ships.gd"

# controlling the ships
export (int) var engine_thrust         # how fast you can fly
export (int) var spin_thrust           # how fast you can turn
var thrust = Vector2()                 # math calculation for thrust
var rotation_dir = 0                   # math calculation for steering

# fire comes from the exhaust when you fly your ship forward, cool huh?
onready var thrusters_particle = preload("res://ships/Thrusters.tscn")
onready var thrusters = thrusters_particle.instance()
var is_thrusting = false

# ready function
func _ready():
	thrusters.set_emitting(false)               # sets thruster flames off by default
	add_child(thrusters)                        # thrusters becomes part of every ship
	set_process_input(true)                     # start receiving input

# INPUT FUNCTION
func _input(event):                             # turns thruster flames on
    if(event.is_action_pressed("ui_up")):       # when you move forward.
        is_thrusting = true                     # they stay lit up until
    elif(event.is_action_released("ui_up")):    # until you release forward.
        is_thrusting = false                    # no thrusters when in reverse

# GET INPUT FUNCTION
func get_input():
	if Input.is_action_pressed("ui_up"):         # move ship forward
		thrust = Vector2(engine_thrust, 0)       # math for forward thrust
	elif Input.is_action_pressed("ui_down"):     # move ship backwards
		thrust = Vector2(-engine_thrust, 0)      # math for reverse thrust
	else:                                        # returns ship to a stationary position
		thrust = Vector2()                       # no thrust when no input is received
	rotation_dir = 0                             # holds steering informationfor ships
	if Input.is_action_pressed("ui_right"):      # turns right when you press right
		rotation_dir += 1                        # steering math for right turns
	if Input.is_action_pressed("ui_left"):       # turns left when you press left
		rotation_dir -= 1                        # steering math for left turns
	if Input.is_action_just_pressed("escape"):   # if you press ESCAPE
		get_tree().quit()                        # this function call closes the game

# PHYSICS PROCESS FUNCTION
func _physics_process(delta):                      
	set_applied_force(thrust.rotated(rotation))     # emulates space flight physics
	set_applied_torque(rotation_dir * spin_thrust)  # using drag, rotation, inertia
	if(is_thrusting):                               # checks for key press FORWARD
		thrusters.set_emitting(true)                # if so it activates thrusters
	else:                                           # if FORWARD key isn't pressed
		thrusters.set_emitting(false)               # turns off particle thrusters
	get_input()                                     # holds onto all this info
	
	
	if Input.is_action_just_pressed("shoot"):
		shoot()



