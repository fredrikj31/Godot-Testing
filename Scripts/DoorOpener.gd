extends Node

var tileDetectionNode : Node
var isNearDoor : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tileDetectionNode = get_node("../Player/TileDetection")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	isNearDoor = tileDetectionNode.get("isNearDoor")
	
	if (Input.is_action_just_pressed("interact")):
		if (isNearDoor == true):
			print("Open Door")
