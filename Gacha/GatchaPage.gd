extends Node2D

var CardInfo

# Called when the node enters the scene tree for the first time.
func _ready():
	$Continue.visible = false
	$Back.visible = true
	$Once.visible = true
	$TenTimes.visible = true
	$Transition.visible = false
	$CardSample.visible = false
	Global.currentCard = Global.CardAmount - 1
	CardInfo = Global.Card[Global.currentCard]
	Global.cardsizeUnit = 42
	if CardInfo[0] == "Tool":
		$CardSample.position = Vector2(455,100)
		$CardSample.size = Vector2(Global.cardsizeUnit*5,Global.cardsizeUnit*5)
		$Possibility.position = Vector2(530,355)
	else:
		$CardSample.position = Vector2(455,80)
		$CardSample.size = Vector2(Global.cardsizeUnit*5,Global.cardsizeUnit*7)
		$Possibility.position = Vector2(530,425)
	$CardSample.visible = true
	$Possibility.text = str(float(Global.Pcard[Global.currentCard]-Global.Pcard[Global.currentCard-1])*1000.0/Global.Pcard[Global.CardAmount-1])+"‰"
	#print(float(Global.Pcard[Global.currentCard]))
	print($Possibility.text)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")
	

func _on_timer_timeout():
	$CardSample.visible = false
	Global.currentCard -= 1
	if Global.currentCard < 0:
		Global.currentCard = Global.CardAmount - 1
	#print(Global.currentCard)
	CardInfo = Global.Card[Global.currentCard]
	#print(CardInfo)
	if CardInfo[0] == "Tool":
		$CardSample.position = Vector2(455,100)
		$CardSample.size = Vector2(Global.cardsizeUnit*5,Global.cardsizeUnit*5)
		$Possibility.position = Vector2(530,355)
	else:
		$CardSample.position = Vector2(455,80)
		$CardSample.size = Vector2(Global.cardsizeUnit*5,Global.cardsizeUnit*7)
		$Possibility.position = Vector2(530,425)
	$CardSample.visible = true
	if Global.currentCard == 0:
		$Possibility.text = str(float(Global.Pcard[Global.currentCard])*1000.0/Global.Pcard[Global.CardAmount-1])+"‰"
		#print( float(Global.Pcard[Global.currentCard]) )
	else:
		$Possibility.text = str(float(Global.Pcard[Global.currentCard]-Global.Pcard[Global.currentCard-1])*1000.0/Global.Pcard[Global.CardAmount-1])+"‰"
		#print( float(Global.Pcard[Global.currentCard]-Global.Pcard[Global.currentCard-1]) )
	print($Possibility.text)


