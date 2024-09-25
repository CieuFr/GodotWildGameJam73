extends Node2D

class_name GameManager

var tower_height = 100
var devotion = 0
var gold = 100

func add_gold(amount):
	gold+=amount

func add_devotion(amount):
	devotion+=amount
	print(devotion)
