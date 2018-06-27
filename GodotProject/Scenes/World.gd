extends Node2D

export(PackedScene) var tiles
export(PackedScene) var scene
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	generateGround(5)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func generateGround(length):
	var platform = tiles.instance().get_node("./Ground/platform")
	print(platform)
	var position = Vector2()
	for i in range(0,length):
		position.x = i*platform.get_scale().x*25
		position.y = get_viewport_rect().size.y-25
		platform = platform.duplicate()
		platform.position = position
		$"Ground".add_child(platform)