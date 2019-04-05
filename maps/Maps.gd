extends Node2D



var screensize

func ready():
	screensize = get_viewport().get_visible_rect().size  # tells camera where to look
	
func _on_Ships_shoot(Bullet, _position, _direction):
	var b = Bullet.instance()
	add_child(b)
	b.start(_position, _direction)
