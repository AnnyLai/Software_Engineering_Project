extends Node2D

var tree = preload("res://tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var ranx = RandomNumberGenerator.new().randi_range(0,8016)
	var rany = RandomNumberGenerator.new().randi_range(0,8016)
	$Player.position = Vector2(ranx,rany)
	var treeTemp = []
	treeTemp.resize(10)
	for i in range(10):
		treeTemp[i] = tree.instantiate()
		ranx = RandomNumberGenerator.new().randi_range(50,8000)
		rany = RandomNumberGenerator.new().randi_range(50,8000)
		treeTemp[i].position = Vector2(ranx,rany)
		$".".add_child(treeTemp[i])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
