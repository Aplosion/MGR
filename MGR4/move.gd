extends RigidBody3D

#player texture: Image by <a href="https://www.freepik.com/free-vector/flat-distorted-checkered-background_14213469.htm#query=checkerboard%20pattern&position=1&from_view=keyword&track=ais">Freepik</a>
#road texture: <a href="https://www.freepik.com/free-vector/relief-texture-design_853773.htm#query=road%20texture&position=1&from_view=keyword&track=ais">Image by dotstudio</a> on Freepik
#bottle texture: https://icolorpalette.com/color/
#bottle pickup sound produced with jsfxr, https://sfxr.me/
#bottle and checkmark models by me, free to use without attribution
#music Music by <a href="https://pixabay.com/users/alisha_sutudo-39461785/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=170190">Alisha</a> from <a href="https://pixabay.com/music//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=170190">Pixabay</a>
#


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
		reset_position()
	
		
	#many thanks to dmchurch on github for helping me with this
	#without this line of code, the camera flips every 180 degrees
		
	var angle2 = -atan2(basis.x.z, basis.x.x)
		
	camrig.global_position = global_position
	camrig.global_rotation =Vector3(0,angle2,0)
	print(global_rotation_degrees)	
		
		
func _integrate_forces(state):		
	
	if linear_velocity.y <= 6 and linear_velocity.y >=-6:	
		apply_torque(Vector3(global_transform.basis.x * Input.get_axis("ui_up","ui_down")*30))
	#turn
	if abs(angular_velocity.y) <= 5 :
		apply_torque(Vector3(0,Input.get_axis("ui_right","ui_left") *25,0))
#	print("angular velocity: %s" %angular_velocity + "linear_velocity: %s" %linear_velocity)
	
		
func reset_position():
	position = Vector3(0,0,0)	
	rotation = Vector3(0,-90,0)
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO			
