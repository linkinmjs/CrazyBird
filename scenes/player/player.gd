extends RigidBody2D

@export var force_multiplier: float

var is_dragged = false
var start_position
var force_vector

func _ready() -> void:
	start_position = position
	sleeping_state_changed.connect(_on_sleeping_state_change)


func _physics_process(_delta: float) -> void:
	if is_dragged:
		position = get_global_mouse_position()


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("drag"):
		is_dragged = true

	if event.is_action_released("drag"):
		launch()
	
func launch():
	is_dragged = false
	freeze = false
	force_vector = start_position - position
	apply_impulse(force_vector * force_multiplier)
		
func _on_sleeping_state_change():
	queue_free()
