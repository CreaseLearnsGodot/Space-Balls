extends Node2D
#################################################################################
#    WELCOME TO SPACE BALLS!            **SPECIAL THANKS TO KIDSCANCODE.ORG!**  #
#      THANKS FOR PLAYING!               EMAIL:  CHRIS@EVERYTECHNOLOGY.COM      #
#################################################################################
#   FREE ROAM PHYSICS LIKE 'SUBSPACE' FOR PVP, PVE, AND A LITTLE BIT OF SOCCER  #
#################################################################################
#  VERSION   1.0                              FILE NAME:  MAPS.GD               #
#  CREATED:  APRIL 3, 2019                    GITHUB:  @CreaseLearnsGodot       #
#  AUTHOR:   CHRIS PHILLIPS                   COMPANY:  EVERYTECHNOLOGY.COM     #
#################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~GNU General Public License 2019 ~~RELEASED FREE FOR COMMERCIAL OR PRIVATE USE~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#################################################################################
#                      Declare Variables/Signals/Constants                      #
#################################################################################
var homeScore = 0
var visitorScore = 0
onready var home_label = get_node("HUD/SCOREBOARD/home_label")
onready var visitor_label = get_node("HUD/SCOREBOARD/visitor_label")
var screensize
#############################################################################
#  Functions                                                                #
#############################################################################

func ready():
	screensize = get_viewport().get_visible_rect().size  # tells camera where to look
	
func _on_Ships_shoot(Bullet, _position, _direction):
	var b = Bullet.instance()
	add_child(b)
	b.start(_position, _direction)
	($SoundShoot).play()

func _on_RightGoalArea_body_entered(body):
	if body.get_name() == "SoccerBall":
		homeScore += 1
		($Goal).play()
		home_label.set_text(str(homeScore))

func _on_LeftGoalArea_body_entered(body):
	if body.get_name() == "SoccerBall":
		visitorScore += 1
		($Goal).play()
		visitor_label.set_text(str(visitorScore))
		
############################################################################
#   FUNCTIONS COMPLETE                                                     #
############################################################################