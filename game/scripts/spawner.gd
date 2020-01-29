extends Node

var MAX_X = 1024-32-64
var MIN_X = 64+32
var MAX_Y = 640-64-32
var MIN_Y = 64+32

var enemies = []

func _ready():
	var enemy = load("res://game/objects/enemy.tscn")
	for i in range(4):
		enemies.append(enemy.instance())
		enemies[i].set_name("Enemy " + str(i))
		randomize()
		enemies[i].position.x = rand_range(MIN_X, MAX_X)
		enemies[i].position.y = rand_range(MIN_Y, MAX_Y)
		add_child(enemies[i])