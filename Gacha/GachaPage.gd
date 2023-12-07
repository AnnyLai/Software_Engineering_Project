extends Node2D

var CardInfo

# Called when the node enters the scene tree for the first time.
func _ready():
	$CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$CoinAndDiamond/GemAmount.text = str(Global.GemAmount)
	$NameAndID/Name.text = Global.register_args["nickname"]
	$NameAndID/PlayerID.text = "ID: " + Global.PlayerID
	$Continue.visible = false
	$Back.visible = true
	$Once.visible = true
	$TenTimes.visible = true
	$Transition.visible = false
	$CardSample.visible = true
	Global.currentCard = Global.RareCardAmount - 1
	CardInfo = Global.Card[Global.currentCard]
	var CardImg = str( "res://png/Gacha/big_" , CardInfo[4] , ".png" )
	#print(CardImg)
	$CardSample/Card.texture = load(CardImg)
	$Possibility.text = str(float(Global.Pcard[Global.currentCard]-Global.Pcard[Global.currentCard-1])*1000.0/Global.Pcard[Global.CardAmount-1])+"‰"
	#print($Possibility.text)
	CardInfo = Global.Card[Global.currentCard-1]
	CardImg = str( "res://png/Gacha/small_" , CardInfo[4] , ".png" )
	$List/First.texture = load(CardImg)
	CardInfo = Global.Card[Global.currentCard]
	CardImg = str( "res://png/Gacha/small_" , CardInfo[4] , ".png" )
	$List/Second.texture = load(CardImg)
	$List.visible = true

func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")
	

func _on_timer_timeout():
	Global.currentCard -= 1
	if Global.currentCard < 0:
		Global.currentCard = Global.RareCardAmount - 1
	CardInfo = Global.Card[Global.currentCard]
	var CardImg = str( "res://png/Gacha/big_" , CardInfo[4] , ".png" )
	$CardSample/Card.texture = load(CardImg)
	if Global.currentCard == 0:
		$Possibility.text = str(float(Global.Pcard[Global.currentCard])*1000.0/Global.Pcard[Global.CardAmount-1])+"‰"
		#print( float(Global.Pcard[Global.currentCard]) )
	else:
		$Possibility.text = str(float(Global.Pcard[Global.currentCard]-Global.Pcard[Global.currentCard-1])*1000.0/Global.Pcard[Global.CardAmount-1])+"‰"
		#print( float(Global.Pcard[Global.currentCard]-Global.Pcard[Global.currentCard-1]) )
	print($Possibility.text)


func _on_coin_and_gem_pressed():
	get_tree().change_scene_to_file("res://TopUpPage.tscn")
