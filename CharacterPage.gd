extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CoinAmount.text = str(Global.CoinAmount)
	$GemAmount.text = str(Global.GemAmount)
	$Name.text = Global.register_args["nickname"]
	$PlayerID.text = "ID: " + Global.PlayerID
	var CardImg = str( "res://png/Character/Archer.png" )
	$Selected.texture = load(CardImg)
	$Selected.scale = Vector2(120,168) / $Selected.texture.get_size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")
