extends KinematicBody2D

onready var player = $AnimatedSprite

var speed : int = 100  # speed in pixels/sec
var velocity : Vector2 = Vector2.ZERO
var isAttacking : bool = false

func _ready():
	player.connect("animation_finished" , self, "checkAnimation")

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
	if (isAttacking == false):
		if Input.is_action_pressed("right") == true || Input.is_action_pressed("left") == true || Input.is_action_pressed("up") == true || Input.is_action_pressed("down") == true:
			player.play("Run")
		else:
			player.play("Idle")

func attack():
	if Input.is_action_pressed("attack"):
		player.play("Attack")
		isAttacking = true
		
func checkAnimation():
	if player.get_animation() == "Attack":
		isAttacking = false
	
func _physics_process(delta):
	attack()
	getInput()
	flipSprite()
	playAnimation()
	velocity = move_and_slide(velocity)
