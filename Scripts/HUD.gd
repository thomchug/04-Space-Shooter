extends Node2D

func _ready():
	pass

func _on_Ship_health_lost():
	var h = get_node("/root/Game/Ship").health
	$Health.text = "Health: " + str(h)
func _on_Ship_score_gained():
	var s = get_node("/root/Game/Ship").score
	$Score.text = "Score: " + str(s)
