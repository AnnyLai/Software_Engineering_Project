extends Node

var startGame = 0
var CardAmount = 10
var storage = []
var cards = 0
var lastrand = 0
var currentCard = 0
var currentStorage = 0
var currentStorageStart = 0
var cardsizeUnit = 0
var CoinAmount = 0
var GemAmount = 0

var http_client = preload("res://HttpClient.tscn")
var url: String = "https://127.0.0.1:5000/"
var reg_func: String = 'register'
var login_func: String = 'login'
var forgot_func: String = 'forgot'
var register_args = {'username': 'c0xffee', 'password': '12345678', 'email': 'haha@mail.com', 'nickname': 'player'}
var login_args = {'username': 'c0xffee', 'password': '12345678'}
var forgot_args = {'username': 'c0xffee', 'email': 'haha@mail.com'}
var PlayerID = "VOIDSALAMANDER12"

var CardUnit = preload("res://Gacha/CardUnit.tscn")

# Characterinfo = [Type, Attack, Defence, Health, Name]
# Toolinfo = [Type, Name]
enum {Guardian, Mercenary, Spearman, Warrior, Knight, Archer, Footman, Mentor, SquadLeader, Tools}

var Card = {
	Guardian : 
		["Character", 1, 1, 2, "Guardian"],
	Mercenary :
		["Character", 2, 2, 0, "Mercenary"],
	Spearman :
		["Character", 2, 2, 5, "Spearman"],
	Warrior :
		["Character", 4, 0, 2, "Warrior"],
	Knight :
		["Character", 2, 3, 6, "Knight"],
	Archer :
		["Character", 2, 1, 3, "Archer"], 
	Footman :
		["Character", 1, 1, 2, "Footman"], 
	Mentor :
		["Character", 3, 0, 1, "Mentor"], 
	SquadLeader :
		["Character", 2, 2, 3, "Squad Leader"],
	Tools :
		["Tool", "Tools"]
}
	
var RareCards = [Guardian, Mercenary, Spearman, Warrior, Knight, Archer, Footman, Mentor, SquadLeader]
var RareCardAmount = 9
var Pcard = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 10000]
