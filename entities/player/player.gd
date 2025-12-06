extends Node2D

var bullet = preload("res://entities/bullet/bullet.tscn")
var direction:int = 0
var speed:int = 100
var shoot_time :=1.0
var shoot_counter = 0



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	shoot_counter += delta
	if Input.is_action_pressed("Shoot") and (shoot_counter>shoot_time):
		shoot_counter=0
		var bullet_instance = bullet.instantiate()
		bullet_instance.position.x = position.x 
		bullet_instance.position.y = position.y-20
		get_parent().get_node("Bullets").add_child(bullet_instance)
	if Input.is_action_pressed("move_left"):
		direction -=1
	elif Input.is_action_pressed("move_right"):
		direction +=1
	else:
		direction = 0
	position.x = clamp(position.x+direction*delta*speed,
	16,400-16)
