extends Area2D
#################################################################################
#                      Declare Variables/Signals/Constants                      #
#################################################################################
export (int) var speed
export (int) var damage
var target = null
var velocity = Vector2()
#################################################################################
#  Functions                                                                    #
#################################################################################
func start(_position, _direction, _target=null):
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	target = _target
	$Lifetime.start()
	

func _process(delta):
	position += velocity * delta

func explode():
	velocity = Vector2()
	$Sprite.hide()
	$Explosion.show()
	$Explosion.play("fire")

func _on_Lifetime_timeout():
	explode()

func _on_Bullet_body_entered(body):
	explode()
	($ExplosionSound).play()
	if body.has_method('take_damage'):
		body.take_damage(damage)

func _on_Explosion_animation_finished():
	queue_free()
############################################################################
#   FUNCTIONS COMPLETE                                                     #
############################################################################