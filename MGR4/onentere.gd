extends Area3D


func _on_body_entered(body):
	$"../AudioStreamPlayer".play()
	queue_free()
