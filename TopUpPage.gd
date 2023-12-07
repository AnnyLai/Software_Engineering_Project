extends Node2D

var amount
# Called when the node enters the scene tree for the first time.
func _ready():
	$CoinAmount.text = str(Global.CoinAmount)
	$GemAmount.text = str(Global.GemAmount)
	$ConfirmBG.visible = false

func _process(delta):
	$CoinAmount.text = str(Global.CoinAmount)
	$GemAmount.text = str(Global.GemAmount)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")

func _on_coin_700_pressed():
	$ConfirmBG/QuestionLabel.text = "confirm to purchase\n700 coins?"
	amount = 700
	$ConfirmBG.visible = true
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = false
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = false
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = false
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = false
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = false
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = false
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = false


func _on_coin_350_pressed():
	$ConfirmBG/QuestionLabel.text = "confirm to purchase\n350 coins?"
	amount = 350
	$ConfirmBG.visible = true
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = false
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = false
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = false
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = false
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = false
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = false
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = false


func _on_coin_100_pressed():
	$ConfirmBG/QuestionLabel.text = "confirm to purchase\n100 coins?"
	amount = 100
	$ConfirmBG.visible = true
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = false
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = false
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = false
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = false
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = false
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = false
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = false


func _on_gem_90_pressed():
	$ConfirmBG/QuestionLabel.text = "confirm to purchase\n90 diamonds?"
	amount = 90
	$ConfirmBG.visible = true
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = false
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = false
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = false
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = false
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = false
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = false
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = false


func _on_gem_60_pressed():
	$ConfirmBG/QuestionLabel.text = "confirm to purchase\n60 diamonds?"
	amount = 60
	$ConfirmBG.visible = true
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = false
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = false
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = false
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = false
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = false
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = false
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = false


func _on_gem_30_pressed():
	$ConfirmBG/QuestionLabel.text = "confirm to purchase\n30 diamonds?"
	amount = 30
	$ConfirmBG.visible = true
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = false
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = false
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = false
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = false
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = false
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = false
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = false


func _on_gem_6_pressed():
	$ConfirmBG/QuestionLabel.text = "confirm to purchase\n6 diamonds?"
	amount = 6
	$ConfirmBG.visible = true
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = false
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = false
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = false
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = false
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = false
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = false
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = false

func _on_cancel_button_pressed():
	$ConfirmBG.visible = false
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = true
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = true
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = true
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = true
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = true
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = true
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = true


func _on_confirm_button_pressed():
	if amount < 100:
		Global.GemAmount += amount
	else:
		Global.CoinAmount += amount
	$ConfirmBG.visible = false
	$ScrollContainer/HBoxContainer/Coins700/coin700.visible = true
	$ScrollContainer/HBoxContainer/Coins350/coin350.visible = true
	$ScrollContainer/HBoxContainer/Coins100/coin100.visible = true
	$ScrollContainer/HBoxContainer/Gems90/gem90.visible = true
	$ScrollContainer/HBoxContainer/Gems60/gem60.visible = true
	$ScrollContainer/HBoxContainer/Gems30/gem30.visible = true
	$ScrollContainer/HBoxContainer/Gems6/gem6.visible = true
