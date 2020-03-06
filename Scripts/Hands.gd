extends Spatial

onready var camBase = get_node("../../CameraBase");
onready var coldpart = get_node("Parts/cold_part");
onready var coldflow = get_node("Parts/cold_flow");
onready var firepart = get_node("Parts/fire_part");
onready var fireflow = get_node("Parts/fire_flow");
onready var an = get_node("AnimationPlayer");

func _ready():
	an.play("ArmatureAction");
	
func _process(delta):
	if !an.is_playing():
		an.play("ArmatureAction");
		coldpart.show();
		coldflow.hide();
		firepart.show();
		fireflow.hide();

func castLeft():
	an.play("left_fire",0.1,8,false);
	
	coldpart.hide();
	coldflow.show();
	fireflow.hide();
	firepart.show();

func castRight():
	an.play("right_fire",0.1,8,false);
	
	firepart.hide();
	fireflow.show();
	coldflow.hide();
	coldpart.show();

