extends Node2D
 # Keeps track of if the object is being clicked/dragged
var selected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		followmouse()

func followmouse():
	position = get_global_mouse_position()


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:  # If mouse clicked
			selected = true
		else:
			selected = false


