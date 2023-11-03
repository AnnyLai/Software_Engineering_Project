extends Node

var startGame = 0
var CardAmount = 6
var storage = []
var store = 0
var lastrand = 0
var currentCard = 0
var currentStorage = 0
var currentStorageStart = 0

var CardUnit = preload("res://Gacha/CardUnit.tscn")

# Characterinfo = [Type, Attack, Defence, Health, Name]
# Toolinfo = [Type, Name]
enum {Guardian, Mercenary, Spearman, Warrior, Knight, Tools}

const Card = {
	Guardian : 
		["Character", 1, 1, 2, "Guardian"],
	Mercenary :
		["Character", 2, 2, 3, "Mercenary"],
	Spearman :
		["Character", 2, 1, 3, "Spearman"],
	Warrior :
		["Character", 4, 0, 2, "Warrior"],
	Knight :
		["Character", 1, 3, 6, "Knight"],
	Tools :
		["Tool", "Tools"]
}
	
const Pcard = [5, 10, 15, 20, 25, 100]
