extends CharacterBody2D

const SPEED = 300.0

@onready var anim = get_node("AnimationPlayer")

func _ready():
	anim.play("stop")
	
func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection = Input.get_axis("ui_left", "ui_right")
	var ydirection = Input.get_axis("ui_up", "ui_down")
	
	#print(xdirection,ydirection)
	if xdirection or ydirection:
		velocity = Vector2(xdirection * SPEED,ydirection * SPEED)
		if ydirection == -1:
			anim.play("back")
		elif ydirection == 1:
			anim.play("front")
			
		if xdirection == -1:
			anim.play("left")
		elif xdirection == 1:
			anim.play("right")
	else:
		velocity = Vector2(0,0)
		anim.play("stop")
	
	move_and_slide()
	
	
