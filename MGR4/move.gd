extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	$RigidBody3D2.position = global_position
		
	if Input.is_action_just_pressed("ui_accept"):
		position = Vector3(1,1,1)	
		rotation = Vector3(0,90,0)
		linear_velocity = Vector3.ZERO
		angular_velocity = Vector3.ZERO
		
	#probably needs a .bas
	apply_torque(Vector3(global_transform.basis.z * Input.get_axis("ui_up","ui_down")*20))
	#turn
	apply_torque(Vector3(0,Input.get_axis("ui_right","ui_left") *40,0))

	
		
