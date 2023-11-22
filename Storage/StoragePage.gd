extends Node2D

var StorageUnit = preload("res://Storage/StorageUnit.tscn")
var storageTemp = []
var CardSize

# Called when the node enters the scene tree for the first time.
func _ready():
	storageTemp.resize(10)
	Global.currentStorage = -1
	#for i in range(6):
		#print( Global.storage[i],',' )
	
	for k in range(2):
		for j in range(5):
			Global.cardsizeUnit = 18
			Global.currentStorage += 1
			if Global.currentStorage == Global.CardAmount:
				break
			#if Global.storage[Global.currentStorageStart+k*5+j] > 0:
			var cardPosition = Vector2( 0, 0)
			var CardInfo = Global.Card[Global.currentStorageStart+k*5+j]
			if CardInfo[0] == "Tool":
				cardPosition = Vector2( 104+205*j , 110+200*k )
				CardSize = Vector2(Global.cardsizeUnit*7,Global.cardsizeUnit*7)
			else:
				cardPosition = Vector2( 122+205*j , 110+200*k )
				CardSize = Vector2(Global.cardsizeUnit*5,Global.cardsizeUnit*7)
			
			storageTemp[k*5+j] = StorageUnit.instantiate()
			storageTemp[k*5+j].position = cardPosition
			storageTemp[k*5+j].visible = false
			storageTemp[k*5+j].scale *= CardSize / storageTemp[k*5+j].size
			$Object.add_child(storageTemp[k*5+j])
			storageTemp[k*5+j].visible = true
				
	if Global.storage[Global.currentStorageStart] > 0:
		$Frame/Frame1/Amount.text = str(Global.storage[Global.currentStorageStart])
	if Global.storage[Global.currentStorageStart+1] > 0:
		$Frame/Frame2/Amount.text = str(Global.storage[Global.currentStorageStart+1])
	if Global.storage[Global.currentStorageStart+2] > 0:
		$Frame/Frame3/Amount.text = str(Global.storage[Global.currentStorageStart+2])
	if Global.storage[Global.currentStorageStart+3] > 0:
		$Frame/Frame4/Amount.text = str(Global.storage[Global.currentStorageStart+3])
	if Global.storage[Global.currentStorageStart+4] > 0:
		$Frame/Frame5/Amount.text = str(Global.storage[Global.currentStorageStart+4])
	if Global.storage[Global.currentStorageStart+5] > 0:
		$Frame/Frame6/Amount.text = str(Global.storage[Global.currentStorageStart+5])
	if Global.storage[Global.currentStorageStart+6] > 0:
		$Frame/Frame7/Amount.text = str(Global.storage[Global.currentStorageStart+6])
	if Global.storage[Global.currentStorageStart+7] > 0:
		$Frame/Frame8/Amount.text = str(Global.storage[Global.currentStorageStart+7])
	if Global.storage[Global.currentStorageStart+8] > 0:
		$Frame/Frame9/Amount.text = str(Global.storage[Global.currentStorageStart+8])
	if Global.storage[Global.currentStorageStart+9] > 0:
		$Frame/Frame10/Amount.text = str(Global.storage[Global.currentStorageStart+9])



func _on_back_pressed():
	for i in range(10):
		if storageTemp[i]:
			storageTemp[i].queue_free()
	get_tree().change_scene_to_file("res://MainPage.tscn")
