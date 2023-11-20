extends Node

var startGame = 0
var CardAmount = 10
var storage = []
var cards = 0
var lastrand = 0
var currentCard = 0
var currentStorage = 0
var currentStorageStart = 0

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
