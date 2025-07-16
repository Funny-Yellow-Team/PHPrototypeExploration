extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Zoom()
	SimplePan()
	ClickAndDrag()

func Zoom():
	if Input.is_action_just_pressed("camera_zoom_in"):
		fov = fov * 1.1
		
	if Input.is_action_just_pressed("camera_zoom_out"):
		fov = fov * 0.9
	
func SimplePan():
	pass

func ClickAndDrag():
	pass
