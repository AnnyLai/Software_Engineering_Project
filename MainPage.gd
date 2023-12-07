extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$CoinAndDiamond/GemAmount.text = str(Global.GemAmount)
	$NameAndID/Name.text = Global.register_args["nickname"]
	$NameAndID/PlayerID.text = "ID: " + Global.PlayerID
	
func _process(delta):
	$CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$CoinAndDiamond/GemAmount.text = str(Global.GemAmount)
	$NameAndID/Name.text = Global.register_args["nickname"]
	$NameAndID/PlayerID.text = "ID: " + Global.PlayerID


func _on_storage_pressed():
	get_tree().change_scene_to_file("res://Storage/StoragePage.tscn")


func _on_gatcha_pressed():
	get_tree().change_scene_to_file("res://Gacha/GachaPage.tscn")


func _on_new_room_pressed():
	get_tree().change_scene_to_file("res://NewRoom.tscn")


func _on_quick_match_pressed():
	get_tree().change_scene_to_file("res://QuickMatch.tscn")


func _on_coin_and_gem_pressed():
	get_tree().change_scene_to_file("res://TopUpPage.tscn")


func _on_character_pressed():
	get_tree().change_scene_to_file("res://CharacterPage.tscn")


