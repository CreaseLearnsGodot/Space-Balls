extends RigidBody2D

signal shoot

export (PackedScene) var Bullet = preload("res://bullets/Bullet.tscn")


func shoot():
	var dir = Vector2(1, 0).rotated($Muzzle.global_rotation)
	emit_signal('shoot', Bullet,$Muzzle.global_position, dir)












# ignore this til later


#################################################################################
#    WELCOME TO SPACE BALLS!            **SPECIAL THANKS TO KIDSCANCODE.ORG!**  #
#      THANKS FOR PLAYING!  QUESTIONS/COMMENTS:  CHRIS@EVERYTECHNOLOGY.COM      #
#################################################################################
#   FREE ROAM PHYSICS LIKE 'SUBSPACE' FOR PVP, PVE, AND A LITTLE BIT OF SOCCER  #
#################################################################################
#  VERSION   1.0                              FILE NAME:  SHIPS.GD              #
#  CREATED:  APRIL 3, 2019                                                      #
#  AUTHOR:   CHRIS PHILLIPS                                                     #
#  COMPANY:  EVERYTECHNOLOGY.COM                                                #
#################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~GNU General Public License 2019 ~~RELEASED FREE FOR COMMERCIAL OR PRIVATE USE~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#################################################################################

#################################################################################
#                      Declare Variables/Signals/Constants                      #
#################################################################################

#signal shoot                       # universal signal to fire gun
#signal health_changed              # universal signal to adjust health indicator
#signal ammo_changed                # universal signal to adjust ammo indicator
#signal dead                        # universal signal for death

# controlling the ships
#export (int) var engine_thrust         # how fast you can fly
#export (int) var spin_thrust           # how fast you can turn
#var thrust = Vector2()                 # math calculation for thrust
#var rotation_dir = 0                   # math calculation for steering
#var screensize                         # determine size of screen for camera

# fire shoots from the exhaust when you fly your ship forward, cool huh?
#onready var thrusters_particle = preload("res://SpaceShips/Thrusters.tscn")
#onready var thrusters = thrusters_particle.instance()
#var is_thrusting = false

# variables for all things that go boom
#export (PackedScene) var Bullet = preload("res://bullet.tscn") # guns start loaded
#export (int) var speed                      # bullet velocity
#export (int) var damage                     # bullet damage
#export (float) var lifetime                 # how far bullet travels
#var shoot_time = 99999                      # time since last shot was taken
#export (float) var gun_cooldown             # gun cooldown variable
#var can_shoot = true                        # makes sure you have bullets loaded
#var target = null                           # target variable for bullet direction
#export (int) var gun_shots = 1                 # how many shots before cooldown
#export (float, 0, 1.5) var gun_spread = 0.2    # randomizes bullet spread
#export (int) var max_ammo = 99999              # max ammo for bullets
#export (int) var ammo = -1 setget set_ammo     # subtracts bullet every shot

#health and other stuff
#export (int) var max_health          # max health variable setting in menu
#var alive = true                     # starts all ships alive and ready
#var health                           # current health status variable
#var map                              # a variable named map

#############################################################################
#    Funky Fun Functions                                                    #
#############################################################################

# INPUT FUNCTION
#func _input(event):                             # turns thruster flames on
 #   if(event.is_action_pressed("ui_up")):       # when you move forward.
#        is_thrusting = true                     # they stay lit up until
 #   elif(event.is_action_released("ui_up")):    # until you release forward.
  #      is_thrusting = false                    # no thrusters when in reverse

# READY FUNCTION
#func _ready():
#	screensize = get_viewport().get_visible_rect().size  # tells camera where to look
#	thrusters.set_emitting(false)               # sets thruster flames off by default
#	add_child(thrusters)                        # thrusters becomes part of every ship
#	set_process_input(true)                     # start receiving input
#	health = max_health                         # starts everyone at max health
	#$Smoke.emitting = false                     # starts everyone not smoking
#	emit_signal('health_changed', health * 100/max_health)  # signal call for health
#	emit_signal('ammo_changed', ammo * 100/max_ammo)        # signal call for ammo
#	$GunTimer.wait_time = gun_cooldown                      # pray n spray protection

# GET INPUT FUNCTION
#func get_input():
#	if Input.is_action_pressed("ui_up"):         # move ship forward
#		thrust = Vector2(engine_thrust, 0)       # math for forward thrust
#	elif Input.is_action_pressed("ui_down"):     # move ship backwards
#		thrust = Vector2(-engine_thrust, 0)      # math for reverse thrust
#	else:                                        # returns ship to a stationary position
#		thrust = Vector2()                       # no thrust when no input is received
#	rotation_dir = 0                             # holds steering informationfor ships
#	if Input.is_action_pressed("ui_right"):      # turns right when you press right
#		rotation_dir += 1                        # steering math for right turns
#	if Input.is_action_pressed("ui_left"):       # turns left when you press left
#		rotation_dir -= 1                        # steering math for left turns
#	if Input.is_action_just_pressed("escape"):   # if you press ESCAPE
#		get_tree().quit()                        # this function call closes the game

# PHYSICS PROCESS FUNCTION
#func _physics_process(delta):                # respawn mechanic
#	set_applied_force(thrust.rotated(rotation))     # emulates space flight physics
#	set_applied_torque(rotation_dir * spin_thrust)  # using drag, rotation, inertia
#	if(is_thrusting):                               # checks for key press FORWARD
#		thrusters.set_emitting(true)                # if so it activates thrusters
#	else:                                           # if FORWARD key isn't pressed
#		thrusters.set_emitting(false)               # turns off particle thrusters
#	get_input()                                     # holds onto all this info
#	if not alive:                            # checks if you're dead
#		return                               # then respawns somewhere on map
#	control(delta)
#	if map:
#		var tile = map.get_cellv(map.world_to_map(position))

# THE SHOOT FUNCTION FOR ALL SHIPS



#func shoot(num, spread, target=null):
#	if can_shoot and ammo != 0:
#		self.ammo -= 1
#		can_shoot = false
#		$GunTimer.start()
#	var dir = Vector2(1, 0).rotated($Muzzle.global_rotation)
#		if num > 1:
#			for i in range(num):
#				var a = -spread + i * (2*spread)/(num-1)
#	emit_signal('shoot', Bullet, $Muzzle.global_position, dir.rotated, target)
#		else:
#			emit_signal('shoot', Bullet, $Muzzle.global_position, dir, target)
#		$AnimationPlayer.play('muzzle_flash')





#	if target:
#		var target_dir = (target.global_position - global_position).normalized()
#		var current_dir = Vector2(1, 0).rotated(self.global_rotation)
#		self.global_rotation = current_dir.linear_interpolate(target_dir, engine_thrust * delta).angle()
#		if target_dir.dot(current_dir) > 0.9:
#			shoot(gun_shots, gun_spread, target)

# DAMAGE FUNCTION - CHANGES HEALTH, SMOKE STATUS, EXPLODES SHIP WHEN YOU DIE
#func take_damage(amount):
#	health -= amount
#	emit_signal('health_changed', health * 100/max_health)
#	if health < max_health / 2:
#		$Smoke.emitting = true
#	if health <= 0:
#		explode()

# HEAL FUNCTION - HEALS YOUR SHIP WHEN YOU PICK UP A HEALING ITEM
#func heal(amount):
#	health += amount
#	health = clamp(health, 0, max_health)
#	emit_signal('health_changed', health * 100/max_health)
#	if health >= max_health / 2:
#		$Smoke.emitting = false

# EXPLODE SHIP WHEN DEAD, REMOVE ASSETS FROM GAME FIELD, SEND DEAD SIGNAL
#func explode():
#	$CollisionShape2D.disabled = true
#	alive = false
#	$Turret.hide()
#	$Body.hide()
#	$Explosion.show()
#	$Explosion.play()
#	emit_signal('dead')

# GUN COOLDOWN FUNCTION     -   GOOD OL' SPRAY N' PRAY PROTECTION
#func _on_GunTimer_timeout():
#	can_shoot = true

# REMOVES EXPLOSION SPRITES WHEN ANIMATION IS FINISHED
#func _on_Explosion_animation_finished():
#	queue_free()

# MANAGES PICKED UP AMMO COUNTER, ENFORCES MAX AMMO LIMIT
#func set_ammo(value):
#	if value > max_ammo:
#		value = max_ammo
#	ammo = value
#	emit_signal('ammo_changed', ammo * 100/max_ammo)

############################################################################
#~~~FUNKIN FUNCTIONS ARE DONE~~~~~~~~~ONLY COMMENTED CODE SNIPPETS BELOW~~~#
############################################################################
#                                                                          #
#                                                                          #
############################################################################
#    TO MAKE IT LIKE ASTEROIDS, FIXED SCREEN WARP ON OTHER SIDE            #
############################################################################
#
#func _integrate_forces(state):
#	set_applied_force(thrust.rotated(rotation))
#	set_applied_torque(rotation_dir * spin_thrust)
#	var xform = state.get_transform()
#	if xform.origin.x > screensize.x:
#		xform.origin.x = 0
#	if xform.origin.x < 0:
#		xform.origin.x = screensize.x
#	if xform.origin.y > screensize.y:
#		xform.origin.y = 0
#	if xform.origin.y < 0:
#		xform.origin.y = screensize.y
#	state.set_transform(xform)
#
###########################################################################


