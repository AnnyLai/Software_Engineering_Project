extends Node

var startGame = 0
var CardAmount = 3
var storage = []
var cards = 0
var lastrand = 0
var currentCard = 0
var currentStorage = 0
var currentStorageStart = 0
var cardsizeUnit = 0
var CoinAmount = 0
var GemAmount = 0
var currentAction = 0
var response

var reg_func: String = 'register'
var login_func: String = 'login'
var forgot_func: String = 'forget'
var verify_func: String = 'verify'
var register_args = {'username': 'c0xffee', 'password': '12345678', 'email': 'haha@mail.com', 'nickname': 'player'}
var login_args = {'username': 'c0xffee', 'password': '12345678'}
var forgot_args = {'email': 'haha@mail.com'}
var verify_args = {'email': 'haha@mail.com', 'password': '12345678', 'vcode': ''} 
var PlayerID = "VOIDSALAMANDER12"
var Accounts = []
var CardUnit = preload("res://Gacha/CardUnit.tscn")

# Characterinfo = [Type, Attack, Defence, Health, Name]
# Toolinfo = [Type, Name]
enum {Ecologist, WarCorrespondent, Tools}

var Card = {
	Ecologist : 
		["Character", 1, 1, 2, "Ecologist"],
	WarCorrespondent :
		["Character", 2, 2, 0, "WarCorrespondent"],
	Tools :
		["Tool", "Tools"]
}
	
var RareCards = [Ecologist, WarCorrespondent]
var RareCardAmount = 2
var Pcard = [5.0, 10.0, 10000.0]
#var Pcard = [4999.0, 9998.0, 10000.0]
