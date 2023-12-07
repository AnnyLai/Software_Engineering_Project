extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Start.visible = true
	Global.storage.resize(100)
	Global.storage.fill(0)
	Global.lastrand = 0
	Global.startGame = 1
	Global.currentCard = 0
	Global.currentStorage = 0
	Global.currentStorageStart = 0
	Global.response = {"status": ""}


func _on_start_pressed():
	get_tree().change_scene_to_file("res://LoginPage.tscn")
