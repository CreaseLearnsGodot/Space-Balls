extends "res://ships/Ships.gd"

#onready var parent = get_parent()
#export var max_speed = 400
#export var speed = 400
var target = null
export (int) var detect_radius


func _ready():
    var circle = CircleShape2D.new()
    $DetectRadius/CollisionShape2D.shape = circle
    $DetectRadius/CollisionShape2D.shape.radius = detect_radius

#func control(delta):
#	if parent is PathFollow2D:
#		if $LookAhead1.is_colliding() or $LookAhead2.is_colliding():
#			speed = lerp(speed, 0, 0.1)
#		else:
#			speed = lerp(speed, max_speed, 0.05)
#		parent.set_offset(parent.get_offset() + speed * delta)
#		position = Vector2()
#	else:
#		# other movement code
#		pass

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		target_dir = $Muzzle
		shoot()

func _on_DetectRadius_body_entered(body):
	if body.name == 'Player':
		target = body

func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null
	print("body exited")