extends Node

var Enemy_scene := preload("res://entities/enemies/enemy.tscn")

func _ready() -> void:
	get_parent().get_node("Boundary").area_entered.connect(_the_end)
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 2.5
	timer.timeout.connect(_create_enemy)
	timer.start()

func _the_end(body:Node):
	if body is Enemy:
		get_tree().set_pause(true)
		

func _create_enemy():
	var enemy = Enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)


func _process(delta: float) -> void:
	pass
