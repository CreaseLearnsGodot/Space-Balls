extends RigidBody2D

#################################################################################
#    WELCOME TO SPACE BALLS!            **SPECIAL THANKS TO KIDSCANCODE.ORG!**  #
#      THANKS FOR PLAYING!               EMAIL:  CHRIS@EVERYTECHNOLOGY.COM      #
#################################################################################
#   FREE ROAM PHYSICS LIKE 'SUBSPACE' FOR PVP, PVE, AND A LITTLE BIT OF SOCCER  #
#################################################################################
#  VERSION   1.0                              FILE NAME:  SHIPS.GD              #
#  CREATED:  APRIL 3, 2019                    GITHUB:  @CreaseLearnsGodot       #
#  AUTHOR:   CHRIS PHILLIPS                   COMPANY:  EVERYTECHNOLOGY.COM     #
#################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~GNU General Public License 2019 ~~RELEASED FREE FOR COMMERCIAL OR PRIVATE USE~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#################################################################################
#                      Declare Variables/Signals/Constants                      #
#################################################################################

signal shoot                       
signal health_changed             
signal dead
signal shields_up

export (int) var max_health          
var health                           
var can_shoot = true
var alive = true
export (float) var gun_cooldown
export (PackedScene) var Bullet = preload("res://bullets/Bullet.tscn")
var shieldsUp = false

#################################################################################
#  Functions                                                                    #
#################################################################################

func _process(delta):
	if $ShieldTimer.is_stopped():
		shieldsUp = false

func _ready():
	health = max_health
	emit_signal('health_changed', health * 100/max_health)
	$GunTimer.wait_time = gun_cooldown

func take_damage(amount):
	if shieldsUp:
		health -= amount/2
		emit_signal('health_changed', health * 100/max_health)
	else:
		health -= amount
		emit_signal('health_changed', health * 100/max_health)
	if health <= 0:
			explode()

func explode():
	$CollisionShape2D.call_deferred('free')
	can_shoot = false
	alive = false
	$Body.hide()
	$Explosion.show()
	$Explosion.play()
	emit_signal('dead')

func _on_GunTimer_timeout():
	if alive != false:
		can_shoot = true
	
func _on_Explosion_animation_finished():
	queue_free()

func shield():
	shieldsUp = true
	emit_signal('shields_up')
	$ShieldTimer.start()
	($Bloop).play()
	if $ShieldTimer.is_stopped():
		shieldsUp = false

func heal(amount):
	health += amount
	health = clamp(health, 0, max_health)
	emit_signal('health_changed', health * 100/max_health)
	($Bloop).play()

func shoot():
    if can_shoot:
        can_shoot = false
        $GunTimer.start()
        var dir = Vector2(1, 0).rotated($Muzzle.global_rotation)
        emit_signal('shoot', Bullet,$Muzzle.global_position, dir)

############################################################################
#~~~FUNKIN FUNCTIONS ARE DONE~~~~~~~~~ONLY COMMENTED CODE SNIPPETS BELOW~~~#
############################################################################
#                                                                          #
#                                                                          #
############################################################################
#    SCRIPT FOR "ASTEROIDS" STYLE, FIXED SCREEN WARP ON OTHER SIDE         #
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
