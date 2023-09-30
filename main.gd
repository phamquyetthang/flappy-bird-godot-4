extends Node2D

var pipeNode = preload("res://pipe.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground.scroll_offset.x -= 50 * delta
	$CanvasLayer/Control/Score.text = str(Global.score)
	pass


func _on_timer_timeout():
	if Global.start:
		var newPipe = pipeNode.instantiate()
		newPipe.position.x = get_viewport_rect().end.x
		var height = get_viewport_rect().size.y/2
		# 176 -> 512
		newPipe.position.y = randf_range( height* 0.02, height * 0.4)
		add_child(newPipe)
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.die()
	pass # Replace with function body.
