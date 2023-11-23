extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Light.visible = false

func _on_visibility_changed():
	SetCard()

func SetCard():
	var CardInfo = Global.Card[Global.currentCard]
	Global.cardsizeUnit = 50
	#string of path to png file
	var CardImg
	if CardInfo[0] == "Tool":
		CardImg = str( "res://png/" , CardInfo[0] , "/" , CardInfo[1] , ".png" )
		get_node(".").size.x = 250
		get_node(".").size.y = 250
		$Light.visible = false
	else:
		CardImg = str( "res://png/" , CardInfo[0] , "/" , CardInfo[4] , ".png" )
		get_node(".").size.x = 250
		get_node(".").size.y = 350
		$"Light".visible = true
		
	var CardSize = get_node(".").size
	$Card.texture = load(CardImg)
	$Card.scale = CardSize / $Card.texture.get_size()
	$Board.scale = CardSize / $Board.texture.get_size()
	$Card.visible = true

