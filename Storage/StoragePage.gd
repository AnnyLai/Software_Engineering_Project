extends Node2D

var StorageUnit = preload("res://Storage/StorageUnit.tscn")
var storageTemp = []
var CardSize

# Called when the node enters the scene tree for the first time.
func _ready():
	storageTemp.resize(12)
	Global.currentStorage = -1
	for i in range(6):
		print( Global.storage[i],',' )
	
	for k in range(3):
		for j in range(4):
			Global.currentStorage += 1
			if Global.storage[Global.currentStorageStart+k*4+j] > 0:
				var cardPosition = Vector2( 0, 0)
				var CardInfo = Global.Card[Global.currentStorageStart+k*4+j]
				if CardInfo[0] == "Tool":
					cardPosition = Vector2( 100+270*j , 59+200*k )
					CardSize = Vector2(140,140)
				else:
					cardPosition = Vector2( 120+270*j , 59+200*k )
					CardSize = Vector2(100,140)
				
				storageTemp[k*4+j] = StorageUnit.instantiate()
				storageTemp[k*4+j].position = cardPosition
				storageTemp[k*4+j].visible = false
				storageTemp[k*4+j].scale *= CardSize / storageTemp[k*4+j].size
				$Object.add_child(storageTemp[k*4+j])
				storageTemp[k*4+j].visible = true
				
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
	if Global.storage[Global.currentStorageStart+10] > 0:
		$Frame/Frame11/Amount.text = str(Global.storage[Global.currentStorageStart+10])
	if Global.storage[Global.currentStorageStart+11] > 0:
		$Frame/Frame12/Amount.text = str(Global.storage[Global.currentStorageStart+11])



func _on_back_pressed():
	for i in range(12):
		if storageTemp[i]:
			storageTemp[i].queue_free()
	get_tree().change_scene_to_file("res://MainPage.tscn")
