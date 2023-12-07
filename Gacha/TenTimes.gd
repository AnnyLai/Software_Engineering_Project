extends TouchScreenButton

var cardTemp = []
var CardSize
var press = 0

func _on_pressed():
	$"..".visible = false
	$"../../Once".visible = false
	$"../../CoinAndDiamond".visible = false
	$"../../NameAndID".visible = false
	$"../../CardSample".visible = false
	$"../../Possibility".visible = false
	$"../../CardSample/Timer".stop()
	$"../../List".visible = false
	$"../../Transition".visible = true
	$"../../Transition".play("transition")
	press = 1
	#print(300)
	
func _on_transition_animation_finished():
	if press == 1:
		$"../../Transition".visible = false
		drawTenTimes()
	

func drawTenTimes():
	cardTemp.resize(10)
	$"../../Continue".visible = true
	$"../../Back".visible = false
	
	for k in range(2):
		for j in range(5):
			Global.cardsizeUnit = 15
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
				cardPosition = Vector2(135+190*j , 95+230*k)
				CardSize = Vector2(Global.cardsizeUnit*8,Global.cardsizeUnit*8)
			else:
				cardPosition = Vector2(115+190*j , 115+230*k)
				CardSize = Vector2(Global.cardsizeUnit*11,Global.cardsizeUnit*5)
			Global.lastrand = randnum
			Global.currentCard = i
	
			cardTemp[k*5+j] = Global.CardUnit.instantiate()
			cardTemp[k*5+j].position = cardPosition
			cardTemp[k*5+j].visible = false
			cardTemp[k*5+j].scale *= CardSize / cardTemp[k*5+j].size
			$"../../Cards".add_child(cardTemp[k*5+j])
			cardTemp[k*5+j].visible = true


func _on_continue_pressed():
	if press == 1:
		for i in range(10):
			cardTemp[i].queue_free()
		press = 0
	$"..".visible = true




