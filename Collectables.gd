extends Node2D


var Cherry = preload("res://Collectables/Cherry.tscn")


func _on_timer_timeout():
	var cherryTemp = Cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var ranint = rng.randi_range(50,1900)
	cherryTemp.position = Vector2(ranint,255)
	get_node("Node2D").add_child(cherryTemp)
