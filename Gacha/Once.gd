extends Button

var cardTemp
var press = 0

func _on_pressed():
	get_node(".").visible = false
	$"../TenTimes".visible = false
	$"../Transition".visible = true	
	$"../Transition".play("transition")
	press = 1
	
func _on_transition_animation_finished():
	if press == 1:
		$"../Transition".visible = false
		drawOnce()
	
	
func drawOnce():
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
		cardPosition = Vector2(460,190)
	else:
		#print( "storage[" , Global.store , "] = " , CardInfo[4] )
		cardPosition = Vector2(460,150)
	Global.store += 1
	#print( "lastrand before = " , Global.lastrand )
	Global.lastrand = randnum
	#print( "lastrand = " , Global.lastrand )
	#print( "randnum = " , randnum )
	Global.currentCard = i
	
	cardTemp = Global.CardUnit.instantiate()
	cardTemp.position = cardPosition
	cardTemp.visible = false
	$"../Cards".add_child(cardTemp)
	cardTemp.visible = true
	$"../Continue".visible = true
	$"../TenTimes".visible = false
	$"../Back".visible = false


func _on_continue_pressed():
	if press == 1:
		cardTemp.queue_free()
		press = 0
	get_node(".").visible = true
	$"../Continue".visible = false
	$"../Back".visible = true






