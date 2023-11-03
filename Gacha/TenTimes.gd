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
			var randnum = ( randi() + Global.lastrand ) % 100 + 1
			var i = 0
			var cardPosition = Vector2( 0, 0)
			if randnum > Global.Pcard[0]:
				while randnum > Global.Pcard[i]:
					i += 1
			Global.storage[i] += 1
			var CardInfo = Global.Card[i]
			if CardInfo[0] == "Tool":
				#print( "storage[" , Global.store , "] = " , CardInfo[1] )
				cardPosition = Vector2(140+190*j , 120+300*k)
				CardSize = Vector2(100,100)
			else:
				#print( "storage[" , Global.store , "] = " , CardInfo[4] )
				cardPosition = Vector2(140+190*j , 100+300*k)
				CardSize = Vector2(100,140)
			Global.store += 1
			#print( "lastrand before = " , Global.lastrand )
			Global.lastrand = randnum
			#print( "lastrand = " , Global.lastrand )
			#print( "randnum = " , randnum )
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




