extends RigidBody2D

var MAX_SPEED = 500
var ACCELERATION = 2000
var motion = Vector2()
var damage = 1

func _physics_process(delta):
	apply_impulse(Vector2(0, 0), motion.normalized()*ACCELERATION*delta)

func _on_Timer_timeout():
	randomize()
	motion.x = rand_range(-1, 1)
	motion.y = rand_range(-1, 1)


func _on_Enemy_body_exited(body):
	if body.name == "Player":
		body.get_damage(damage)