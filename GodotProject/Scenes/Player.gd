extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = 10
var playing = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _unhandled_input(event):
    if event is InputEventKey:
        if event.pressed and event.scancode == KEY_ENTER:
            playing = !playing
	
func _physics_process(delta):
	if playing:
		move_and_collide(Vector2(speed,0))
