extends Spatial

onready var camBase = get_node("../../CameraBase");
onready var coldpart = get_node("parts/cold_part");
onready var coldflow = get_node("parts/cold_flow");
onready var firepart = get_node("parts/fire_part");
onready var fireflow = get_node("parts/fire_flow");
onready var an = get_node("AnimationPlayer");
#var test_yaw = 0;

func _ready():
	an.play("ArmatureAction");
	
func _process(delta):
	if !an.is_playing():
		an.play("ArmatureAction");
		coldpart.show();
		coldflow.hide();
		firepart.show();
		fireflow.hide();
		camBase.mIsFiring[0] = false;
		camBase.mIsFiring[1] = false;
		
		
func castLeft():
	an.play("left_fire",0.1,1,false);
	coldpart.hide();
	coldflow.show();
	fireflow.hide();
	firepart.show();
	camBase.mIsFiring[0] = true;
	camBase.mIsFiring[1] = false;
			
func castRight():
	an.play("right_fire",0.1,1,false);
	firepart.hide();
	fireflow.show();
	coldflow.hide();
	coldpart.show();
	camBase.mIsFiring[0] = false;
	camBase.mIsFiring[1] = true;
#func _input(event):		
	"""if(Input.is_key_pressed(KEY_C)):
		test_yaw -= 2;
		
	if(Input.is_key_pressed(KEY_V)):
		test_yaw += 2;
		
	#set_translation((Vector3(0, -0.065057,-3)));
	rotate_object_local(Vector3(0,1,0),deg2rad(2));
	#set_translation((Vector3(0, 0, 0)));"""
