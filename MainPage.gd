extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.startGame == 0:
		Global.storage.resize(100)
		Global.storage.fill(0)
		Global.lastrand = 0
		Global.startGame = 1
		Global.currentCard = 0
		Global.currentStorage = 0
		Global.currentStorageStart = 0


func _on_storage_pressed():
	get_tree().change_scene_to_file("res://Storage/StoragePage.tscn")


func _on_gatcha_pressed():
	get_tree().change_scene_to_file("res://Gacha/GatchaPage.tscn")


func _on_new_room_pressed():
	get_tree().change_scene_to_file("res://NewRoom.tscn")


func _on_quick_match_pressed():
	get_tree().change_scene_to_file("res://QuickMatch.tscn")


func _on_coin_and_gem_pressed():
	get_tree().change_scene_to_file("res://TopUp.tscn")


func _on_character_pressed():
	get_tree().change_scene_to_file("res://CharacterPage.tscn")
