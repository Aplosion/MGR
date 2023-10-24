extends RigidBody3D

#Image by <a href="https://www.freepik.com/free-vector/flat-distorted-checkered-background_14213469.htm#query=checkerboard%20pattern&position=1&from_view=keyword&track=ais">Freepik</a>

@onready var camrig = $"../CameraRig"

# Called when the node enters the scene tree for the first time.
func _ready():
	camrig.top_level = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		
	var last_y_angle = global_rotation.y
	
		
	if Input.is_action_just_pressed("ui_accept"):
		position = Vector3(0,0,0)	
		rotation = Vector3(0,-90,0)
		linear_velocity = Vector3.ZERO
		angular_velocity = Vector3.ZERO	
	var angle1 = camrig.global_rotation.y 
	var angle2 = global_rotation.y
	var new_angle = lerp_angle(angle1, angle2, 0.1)
	camrig.global_rotation = Vector3(0, new_angle, 0)
	camrig.global_position = global_position
#	camrig.global_rotation =Vector3(0,lerp_angle(last_y_angle, global_rotation.y, .5),0)
	print(global_rotation_degrees.y)	
		
		
func _integrate_forces(state):		
		
	
		
	apply_torque(Vector3(global_transform.basis.x * Input.get_axis("ui_up","ui_down")*20))
	#turn
	apply_torque(Vector3(0,Input.get_axis("ui_right","ui_left") *40,0))

	
		
