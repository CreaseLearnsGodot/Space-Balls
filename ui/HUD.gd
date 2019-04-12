extends CanvasLayer
#################################################################################
#    WELCOME TO SPACE BALLS!            **SPECIAL THANKS TO KIDSCANCODE.ORG!**  #
#      THANKS FOR PLAYING!               EMAIL:  CHRIS@EVERYTECHNOLOGY.COM      #
#################################################################################
#   FREE ROAM PHYSICS LIKE 'SUBSPACE' FOR PVP, PVE, AND A LITTLE BIT OF SOCCER  #
#################################################################################
#  VERSION   1.0                              FILE NAME:  HUD.GD               #
#  CREATED:  APRIL 3, 2019                    GITHUB:  @CreaseLearnsGodot       #
#  AUTHOR:   CHRIS PHILLIPS                   COMPANY:  EVERYTECHNOLOGY.COM     #
#################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~GNU General Public License 2019 ~~RELEASED FREE FOR COMMERCIAL OR PRIVATE USE~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#################################################################################
#                      Declare Variables/Signals/Constants                      #
#################################################################################
var bar_red = preload("res://assets/UI/barHorizontal_red_mid 200.png")
var bar_green = preload("res://assets/UI/barHorizontal_green_mid 200.png")
var bar_yellow = preload("res://assets/UI/barHorizontal_yellow_mid 200.png")
var bar_texture
#################################################################################
#  Functions                                                                    #
#################################################################################

func show_shield():
	$Margin/Container/Shield.show()

func hide_shield():
	$Margin/Container/Shield.hide() 

func update_healthbar(value):
    bar_texture = bar_green
    if value < 60:
        bar_texture = bar_yellow
    if value < 25:
        bar_texture = bar_red
    $Margin/Container/HealthBar.texture_progress = bar_texture
    $Margin/Container/HealthBar/Tween.interpolate_property($Margin/Container/HealthBar,
            'value', $Margin/Container/HealthBar.value, value,
            0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    $Margin/Container/HealthBar/Tween.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'healthbar_flash':
		$Margin/Container/HealthBar.texture_progress = bar_texture
############################################################################
#   FUNCTIONS COMPLETE                                                     #
############################################################################