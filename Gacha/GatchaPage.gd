extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Continue.visible = false
	$Back.visible = true
	$Once.visible = true
	$TenTimes.visible = true
	$Transition.visible = false



func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")
