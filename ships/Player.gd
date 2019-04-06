extends "res://ships/Ships.gd"
#################################################################################
#    WELCOME TO SPACE BALLS!            **SPECIAL THANKS TO KIDSCANCODE.ORG!**  #
#      THANKS FOR PLAYING!               EMAIL:  CHRIS@EVERYTECHNOLOGY.COM      #
#################################################################################
#   FREE ROAM PHYSICS LIKE 'SUBSPACE' FOR PVP, PVE, AND A LITTLE BIT OF SOCCER  #
#################################################################################
#  VERSION   1.0                              FILE NAME:  PLAYER.GD               #
#  CREATED:  APRIL 3, 2019                    GITHUB:  @CreaseLearnsGodot       #
#  AUTHOR:   CHRIS PHILLIPS                   COMPANY:  EVERYTECHNOLOGY.COM     #
#################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~GNU General Public License 2019 ~~RELEASED FREE FOR COMMERCIAL OR PRIVATE USE~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#################################################################################
#                      Declare Variables/Signals/Constants                      #
#################################################################################

export (int) var engine_thrust         # how fast you can fly
export (int) var spin_thrust           # how fast you can turn
var thrust = Vector2()                 # math calculation for thrust
var rotation_dir = 0                   # math calculation for steering
onready var thrusters_particle = preload("res://ships/Thrusters.tscn")
onready var thrusters = thrusters_particle.instance()
var is_thrusting = false               # exhaust particles from thrusters
#################################################################################
#  Functions                                                                    #
#################################################################################
func _ready():
	thrusters.set_emitting(false)               # sets thruster flames off by default
	add_child(thrusters)                        # thrusters becomes part of every ship
	set_process_input(true)                     # start receiving input

func _input(event):                             # turns thruster flames on
    if(event.is_action_pressed("ui_up")):       # when you move forward.
        is_thrusting = true                     # they stay lit up until
    elif(event.is_action_released("ui_up")):    # until you release forward.
        is_thrusting = false                    # no thrusters when in reverse

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

func _physics_process(delta):    
	set_applied_force(thrust.rotated(rotation))     # emulates space flight physics
	set_applied_torque(rotation_dir * spin_thrust)  # using drag, rotation, inertia
	if(is_thrusting):                               # checks for key press FORWARD
		thrusters.set_emitting(true)                # if so it activates thrusters
		if not $ThrustSound.playing:
			($ThrustSound).play()  
	else:                                           # if FORWARD key isn't pressed
		thrusters.set_emitting(false)               # turns off particle thrusters
		($ThrustSound).stop()
	get_input()                                     # holds onto all this info
	if Input.is_action_just_pressed("shoot"):
		shoot()                                     # pew! pew!

############################################################################
#   FUNCTIONS COMPLETE                                                     #
############################################################################