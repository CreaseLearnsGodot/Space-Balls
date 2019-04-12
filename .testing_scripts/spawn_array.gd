extends Node
#spawn_array.gd
##  use this for spawning in certain points on the map
var positionarray = []
var objectarray = []
var item
#to add positions to position array
func load_to_array():
	positionarray.append(Vector2()) #use a loop or manually add all the positions using the append()

	var size = positionarray.size()

	for x in range(0, size):
		if objectarray.size() <= x:
			var obj = item.instance() #here node is a packedscene setup as the node that you want to spawn
			obj.position = positionarray[x]
			add_child(obj)
			objectarray.append(obj)
		elif objectarray[x] == null:
			var obj = item.instance() #here node is a packedscene setup as the node that you want to spawn
			obj.position = positionarray[x]
			add_child(obj)
			objectarray[x] = obj