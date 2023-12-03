extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Start.visible = true
	#var test = load("res://HttpRequest.tscn")
	#var testReq = test.instantiate()
	#$".".add_child(testReq)
	#testReq.request()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://LoginPage.tscn")
