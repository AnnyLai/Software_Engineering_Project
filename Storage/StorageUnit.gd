extends MarginContainer

func _on_visibility_changed():
	SetStorage()

func SetStorage():
	var StorageInfo = Global.Card[Global.currentStorage]

	#string of path to png file
	var CardImg
	if StorageInfo[0] == "Tool":
		CardImg = str( "res://png/" , StorageInfo[0] , "/" , StorageInfo[1] , ".png" )
		get_node(".").size.x = 250
		get_node(".").size.y = 250
	else:
		CardImg = str( "res://png/" , StorageInfo[0] , "/" , StorageInfo[4] , ".png" )
		get_node(".").size.x = 250
		get_node(".").size.y = 350
		
	var CardSize = get_node(".").size
	$Object.texture = load(CardImg)
	$Object.scale = CardSize / $Object.texture.get_size()
	$Board.scale = CardSize / $Board.texture.get_size()
	$Object.visible = true



