extends Node2D

export var probability = 0.3
onready var Comet = load("res://Scenes/Comet.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability:
		var m = Comet.instance()
		add_child(m)
