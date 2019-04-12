extends Area2D

enum Items {health, ammo, shield, freeze}

export (Items) var type = Items.health
export (Vector2) var amount = Vector2(10, 25)

func _on_Pickup_body_entered(body):
	match type:
		Items.health:
			if body.has_method('heal'):
				body.heal(int(rand_range(amount.x, amount.y)))
		Items.shield:
			if body.has_method('shield'):
				body.shield()	
	queue_free()