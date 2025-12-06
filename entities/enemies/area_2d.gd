class_name Enemy

extends Area2D

var speed:int =80

func _ready() -> void:
	randomize()
	position = Vector2(randf_range(0.0,400.0),0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	position.y += speed*delta

func _on_area_entered(area: Area2D) -> void:
	if area.name == "BulletArea":
		area.get_parent().queue_free()
		queue_free()
