extends KinematicBody2D

var MAX_SPEED = 500
var ACCELERATION = 2000
var motion = Vector2()
var max_hp = 10
var current_hp = 10

signal die

func update_hpbar():
	if (current_hp < 0):
		emit_signal("die")
	$HPBar.max_value = max_hp
	$HPBar.value = current_hp

func _ready():
	update_hpbar()

func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)


func get_damage(damage):
	current_hp -= 1
	max_hp += damage/10.0
	update_hpbar()


func _on_Timer_timeout():
	print("Start", current_hp, max_hp)
	if (max_hp < (current_hp + 0.1)):
		current_hp = max_hp
	else:
		current_hp += 0.1
	print("End", current_hp, max_hp)
	update_hpbar()
	
