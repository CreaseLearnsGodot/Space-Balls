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

signal shoot                       # universal signal to fire gun
signal health_changed              # universal signal to adjust health indicator
export (PackedScene) var Bullet = preload("res://bullets/Bullet.tscn")
export (int) var max_health          # max health variable setting in menu
var health                           # current health status variable

#################################################################################
#  Functions                                                                    #
#################################################################################

func _ready():
    health = max_health
    emit_signal('health_changed', health * 100/max_health)

func take_damage(amount):
	health -= amount
	emit_signal('health_changed', health * 100/max_health)
#	if health < max_health / 2:
#		$Smoke.emitting = true
	if health <= 0:
		explode()

func explode():
    queue_free()

func shoot():
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