extends TouchScreenButton

var cardTemp
var press = 0
var CardInfo

func _on_pressed():
	get_node(".").visible = false
	$"../OnceLabel".visible = false
	$"../../TenTimes/TenTimesLabel".visible = false
	$"../../TenTimes/TenTimes".visible = false
	$"../../CardSample".visible = false
	$"../../Possibility".visible = false
	$"../../CardSample/Timer".stop()
	$"../../Transition".visible = true	
	$"../../Transition".play("transition")
	press = 1
	
func _on_transition_animation_finished():
	if press == 1:
		$"../../Transition".visible = false
		drawOnce()
	
	
func drawOnce():
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
		cardPosition = Vector2(460,150)
	else:
		cardPosition = Vector2(460,130)

	Global.lastrand = randnum
	Global.currentCard = i
	
	cardTemp = Global.CardUnit.instantiate()
	cardTemp.position = cardPosition
	cardTemp.visible = false
	$"../../Cards".add_child(cardTemp)
	cardTemp.visible = true
	$"../../Continue".visible = true
	$"../../TenTimes/TenTimes".visible = false
	$"../../TenTimes/TenTimesLabel".visible = false
	$"../../Back".visible = false


func _on_continue_pressed():
	if press == 1:
		cardTemp.queue_free()
		press = 0
	get_node(".").visible = true
	$"../OnceLabel".visible = true
	$"../../Continue".visible = false
	$"../../Back".visible = true
	$"../../CardSample".visible = true
	$"../../Possibility".visible = true
	Global.currentCard = Global.CardAmount - 1
	CardInfo = Global.Card[Global.currentCard]
	Global.cardsizeUnit = 45
	if CardInfo[0] == "Tool":
		$"../../CardSample".position = Vector2(455,100)
		$"../../CardSample".size = Vector2(Global.cardsizeUnit*5,Global.cardsizeUnit*5)
		$"../../Possibility".position = Vector2(530,355)
	else:
		$"../../CardSample".position = Vector2(455,80)
		$"../../CardSample".size = Vector2(Global.cardsizeUnit*5,Global.cardsizeUnit*7)
		$"../../Possibility".position = Vector2(530,425)
	$"../../CardSample".visible = true
	$"../../Possibility".text = str(float(Global.Pcard[Global.currentCard]-Global.Pcard[Global.currentCard-1])*1000.0/Global.Pcard[Global.CardAmount-1])+"‰"
	print($"../../Possibility".text)
	$"../../CardSample/Timer".start()






