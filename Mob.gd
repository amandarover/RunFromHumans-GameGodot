extends RigidBody2D

signal hit

export (int) var MIN_SPEED
export (int) var MAX_SPEED
var mob_types = ["pepsi", "cake", "tomato", "egg"]

func _ready():
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _on_Mob_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.disabled = true
