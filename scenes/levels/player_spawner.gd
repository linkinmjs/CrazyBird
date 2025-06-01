extends Marker2D

@export var player_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_player()
	
func _process(delta: float) -> void:
	pass

func create_player():
	var player_instance = player_scene.instantiate()
	add_sibling.call_deferred(player_instance)
	player_instance.position = position
	player_instance.tree_exited.connect(create_player)
