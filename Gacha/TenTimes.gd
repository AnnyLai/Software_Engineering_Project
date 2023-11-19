extends Button

var cardTemp = []
var CardSize
var press = 0

func _on_pressed():
	get_node(".").visible = false
	$"../Once".visible = false
	$"../Transition".visible = true	
	$"../Transition".play("transition")
	press = 1
	
func _on_transition_animation_finished():
	if press == 1:
		$"../Transition".visible = false
		drawTenTimes()
	

func drawTenTimes():
	cardTemp.resize(10)
	$"../Continue".visible = true
	$"../Once".visible = false
	$"../Back".visible = false
	
	for k in range(2):
		for j in range(5):
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
				cardPosition = Vector2(140+190*j , 120+300*k)
				CardSize = Vector2(100,100)
			else:
				cardPosition = Vector2(140+190*j , 100+300*k)
				CardSize = Vector2(100,140)
			Global.lastrand = randnum
			Global.currentCard = i
	
			cardTemp[k*5+j] = Global.CardUnit.instantiate()
			cardTemp[k*5+j].position = cardPosition
			cardTemp[k*5+j].visible = false
			cardTemp[k*5+j].scale *= CardSize / cardTemp[k*5+j].size
			$"../Cards".add_child(cardTemp[k*5+j])
			cardTemp[k*5+j].visible = true


func _on_continue_pressed():
	if press == 1:
		for i in range(10):
			cardTemp[i].queue_free()
		press = 0
	get_node(".").visible = true




