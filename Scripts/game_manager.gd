extends Node2D

class_name GameManager

var tower_height = 100
var devotion = 0
var gold = 100

enum ressources {GOLD, DEVOTION}

func add_gold(amount):
	gold+=amount

func add_devotion(amount):
	devotion+=amount
	print(devotion)
	
func can_buy(type : ressources, amount):
	match type:
		ressources.GOLD:
			if gold<amount:
				return false
			gold-=amount
			return true
		ressources.DEVOTION:
			if devotion<amount:
				return false
			devotion-=amount
			return true
	return false
