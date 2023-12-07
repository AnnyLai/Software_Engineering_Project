extends TouchScreenButton

var cardTemp
var press = 0
var CardInfo

func _on_pressed():
	$"..".visible = false
	$"../../TenTimes".visible = false
	$"../../CoinAndDiamond".visible = false
	$"../../NameAndID".visible = false
	$"../../CardSample".visible = false
	$"../../Possibility".visible = false
	$"../../CardSample/Timer".stop()
	$"../../List".visible = false
	$"../../Transition".visible = true	
	$"../../Transition".play("transition")
	press = 1
	
func _on_transition_animation_finished():
	if press == 1:
		$"../../Transition".visible = false
		drawOnce()
	
	
func drawOnce():
	$"../../Continue".visible = true
	$"../../Back".visible = false
	
	Global.cards += 1
	var randnum
	var i = 0
	var cardPosition = Vector2( 0, 0)
	if Global.cards == 50:
		randnum = randi() % Global.RareCardAmount
		i = Global.RareCards[randnum]
		Global.cards = 0
	else:
		randnum = ( randi() + Global.lastrand ) % 10000 + 1
		if randnum > Global.Pcard[0]:
			while randnum > Global.Pcard[i]:
				i += 1
	
	Global.storage[i] += 1
	var CardInfo = Global.Card[i]
	if CardInfo[0] == "Tool":
		cardPosition = Vector2(308,0)
	else:
		cardPosition = Vector2(0,0)

	Global.lastrand = randnum
	Global.currentCard = i
	
	cardTemp = Global.CardUnit.instantiate()
	cardTemp.position = cardPosition
	cardTemp.visible = false
	$"../../Cards".add_child(cardTemp)
	cardTemp.visible = true


func _on_continue_pressed():
	if press == 1:
		cardTemp.queue_free()
		press = 0
	$"..".visible = true
	$"../../Back".visible = true
	$"../../CoinAndDiamond".visible = true
	$"../../NameAndID".visible = true
	
	$"../../Continue".visible = false
	$"../../Possibility".visible = true
	Global.currentCard = Global.RareCardAmount - 1
	CardInfo = Global.Card[Global.currentCard]
	var CardImg = str( "res://png/Gacha/big_" , CardInfo[4] , ".png" )
	$"../../CardSample/Card".texture = load(CardImg)
	$"../../CardSample".visible = true
	$"../../Possibility".text = str(float(Global.Pcard[Global.currentCard]-Global.Pcard[Global.currentCard-1])*1000.0/Global.Pcard[Global.CardAmount-1])+"‰"
	print($"../../Possibility".text)
	$"../../CardSample/Timer".start()
	$"../../List".visible = true





