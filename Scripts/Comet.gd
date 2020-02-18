extends RigidBody2D

var velocity = Vector2(0, 0)
export var min_speed = 100
export var max_speed = 400
export var contact = 75

onready var Ex = load("res://Scenes/Explosions.tscn")

func _ready():
	randomize()
	position.x = randi() % int(get_viewport_rect().size.x)
	velocity.y = max(randi() % max_speed, min_speed)
	contact_monitor = true
	set_max_contacts_reported(4)
	linear_velocity = velocity

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name != "Laser_B":
			var ex = Ex.instance()
			ex.position = position
			ex.get_node("Ex").playing = true
			get_node("/root/Game/Explosion").add_child(ex)
		if c.name == "Ship":
			c.change_health(-contact)
		queue_free()
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _integrate_forces(state):
	#state.set_linear_velocity(velocity)
	pass

