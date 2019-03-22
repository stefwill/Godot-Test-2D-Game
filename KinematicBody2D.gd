extends KinematicBody2D
# This script controlls movement
const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 200
export var gravity = 20
export var jump_force = -400

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		
	else:
		motion.x = 0
	
	if is_on_floor():
		if  Input.is_action_just_pressed("ui_up"):
			motion.y = jump_force
		
	motion = move_and_slide(motion, UP)
	