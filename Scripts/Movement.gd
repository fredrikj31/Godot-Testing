extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite

var speed = 100  # speed in pixels/sec
var velocity = Vector2.ZERO

func getInput():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1	
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed
	
func flipSprite():
	if Input.is_action_pressed('right'):
		get_node("AnimatedSprite").set_flip_h(false)
	if Input.is_action_pressed('left'):
		get_node("AnimatedSprite").set_flip_h(true)		

func playAnimation():
	if Input.is_action_pressed("right") == true || Input.is_action_pressed("left") == true || Input.is_action_pressed("up") == true || Input.is_action_pressed("down") == true:
		_animated_sprite.play("Run")
	else:
		_animated_sprite.play("Idle")
				

func _physics_process(delta):
	getInput()
	flipSprite()
	playAnimation()
	velocity = move_and_slide(velocity)
