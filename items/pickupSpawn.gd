extends Node2D

onready var size = $PickupRadius/Rectangle.shape.extents * 90
onready var radius = get_node("PickupRadius")
onready var rectangle = get_node("PickupRadius/Rectangle")
onready var centerpos = radius.position + rectangle.position
var positionInArea = Vector2()
export var spawnNow = 3
export var spawnMax = 22
var spawnTotal = 0

var master_list = [preload("res://items/Health.tscn"), preload("res://items/Shield.tscn")]

func _ready():
	$SpawnTimer.start()
	randi()

func create_pickup():
	positionInArea.x = (randi() % int(size.x)) - (size.x/2) + centerpos.x
	positionInArea.y = (randi() % int(size.y)) - (size.y/2) + centerpos.y
	var item = master_list[randi() % master_list.size() - 1].instance()
	item.position = positionInArea
	add_child(item)
	item.add_to_group('PickupsDeployed')
	
func spawn_count():
	var spawnTotal = get_tree().get_nodes_in_group('PickupsDeployed')
	spawnTotal = spawnTotal.size()
	print(spawnTotal)
	if (spawnTotal >= spawnMax):
		pass
	else:
		if(spawnTotal < spawnMax):
			for spawnTotal in spawnNow:
				create_pickup()

func _on_SpawnTimer_timeout():
	spawn_count()