extends Camera3D

@export var background_text : Texture2D
@export var foreground_text : Texture2D

func _ready():

	# Create a new CanvasLayer (2D layer that renders independently of camera)
	var background_layer = CanvasLayer.new()
	#var foreground_layer = CanvasLayer.new()
	# Set layer to very negative number to ensure it's behind everything
	background_layer.layer = -999
	#foreground_layer.layer = -999
	add_child(background_layer)
	#add_child(foreground_layer)
	
	# Create a TextureRect to hold our background image
	var background = TextureRect.new()
	background.texture = background_text
	#var foreground = TextureRect.new()
	#foreground.texture = foreground_text
	
	# Make it fill the entire viewport regardless of image size
	background.anchor_right = 1.0
	background.anchor_bottom = 1.0
	background.expand = true
	background.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	#foreground.anchor_right = 1.0
	#foreground.anchor_bottom = 1.0
	#foreground.expand = true
	#foreground.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	
	# Add it to our background layer
	background_layer.add_child(background)
	#foreground_layer.add_child(foreground)
	
	# Optional: Make sure it resizes with the viewport
	get_viewport().connect("size_changed", _on_viewport_size_changed.bind(background))
	#get_viewport().connect("size_changed", _on_viewport_size_changed_fg.bind(foreground))

func _on_viewport_size_changed(background_rect):
	# Ensure our background always covers the entire screen
	background_rect.size = get_viewport().size

func _on_viewport_size_changed_fg(foreground_rect):
	# Ensure our background always covers the entire screen
	foreground_rect.size = get_viewport().size
