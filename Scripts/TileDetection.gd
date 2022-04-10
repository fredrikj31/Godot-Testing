extends Node

var mainNode : KinematicBody2D
var tilemap : TileMap
var feedbackText : Label
var isNearDoor : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	isNearDoor = false
	mainNode = get_node("../../Player")
	feedbackText = get_node("../../Player/Camera2D/FeedbackText")
	tilemap = get_node("/root/Scene/TileMap")

func getTileName() -> String:
	var playerPosInWorld : Vector2 = tilemap.world_to_map(mainNode.position)
	var cellIndex : int = tilemap.get_cellv(playerPosInWorld)
	
	var tileName :String = tilemap.tile_set.tile_get_name(cellIndex)
	
	return tileName

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tileName : String = getTileName()
	if (tileName == "Tileset.png 20"):
		isNearDoor = true
		feedbackText.text = "Press E to interact"
	else:
		isNearDoor = false
		feedbackText.text = ""
		
