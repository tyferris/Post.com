extends Node2D

# Keeps track of if the object is being clicked/dragged
var selected = false
# Initial position of the object when clicked
var initial_position = Vector2(0, 0)
# Position where the object was released
var release_position = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		follow_mouse()

func follow_mouse():
	position = get_global_mouse_position()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:  # If mouse clicked
			selected = true
			# Store the initial position of the object
			initial_position = position
		else:
			selected = false
			# Store the position where the object was released
			release_position = position
			# Teleport the object back to its initial position
			position = initial_position
