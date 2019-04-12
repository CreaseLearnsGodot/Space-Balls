extends Node2D

var bullet = preload("res://bullets/Bullet.tscn")

func fire(direction):
	if not $CoolDownTimer.is_stopped():
		return
	
	$CoolDownTimer.start()
	var new_bullet = bullet.instance()
	new_bullet.direction = direction
	add_child(new_bullet)