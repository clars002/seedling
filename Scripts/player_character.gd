extends CharacterBody2D

@export var move_speed = 400.0

# _ready() runs when the node enters a scene
func _ready():
	set_motion_mode(1) # motion mode 1 is designed for top-down games (0 is for sidescrollers)

func _physics_process(delta):
	var direction = Vector2.ZERO # create vector to store the direction of movement, initially zero
	if Input.is_action_pressed("move_right"):
		direction.x += 1 # right is positive in godot, so we add 1
	elif Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1 # down is positive in godot
	elif Input.is_action_pressed("move_up"):
		direction.y -= 1
	
	direction = direction.normalized() # normalize the direction vector, so that its length is 1 and it represents direction only
	
	velocity = direction * move_speed # scale the direction vector by the move_speed variable to get the velocity
	
	# already takes delta into account automatically
	move_and_slide() # this built-in function moves the player based on their current velocity, taking into account collisions
