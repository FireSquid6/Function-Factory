extends TileMap
class_name Grid


signal tick()


func _process(delta):
	pass


func _on_Tick_timeout():
	emit_signal("tick")
