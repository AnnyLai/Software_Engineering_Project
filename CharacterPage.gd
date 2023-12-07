extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$CoinAndDiamond/GemAmount.text = str(Global.GemAmount)
	$NameAndID/Name.text = Global.register_args["nickname"]
	$NameAndID/PlayerID.text = "ID: " + Global.PlayerID
	var CardImg = str( "res://png/Gacha/Cards/Character/WarCorrespondent.png" )
	$Selected/Selected.texture = load(CardImg)
	$Selected/Selected.scale = Vector2(275,135) / $Selected/Selected.texture.get_size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")


func _on_coin_and_gem_pressed():
	get_tree().change_scene_to_file("res://TopUpPage.tscn")
