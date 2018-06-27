extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speedX = 10
export var speedY = 2
var startX = 0
var startY = 0
var jumping = false
var playing = false
var applied_force = Vector2(0,0)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _process(delta):
	pass

func parabola(x, height, width):
	return -sqrt(x+width)+height

func jump():
	if not jumping:
		jumping = true
		startX = position.x
		startY = position.y


func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_ENTER:
				playing = !playing
			KEY_SPACE:
				jump()
	
func _physics_process(delta):
	if playing:
		if jumping:
			applied_force = Vector2(speedX, speedY*(parabola(position.x+speedX-startX, 200, 200)-parabola(position.x-startX, 200, 200)))
		else:
			applied_force = Vector2(speedX, 0)
		move_and_collide(applied_force)
		
			