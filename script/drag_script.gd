extends Control

var dragging = false
var drag_offset = Vector2i()

#func _ready():
	#set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			var mouse_screen_pos = DisplayServer.mouse_get_position()
			var window_pos = DisplayServer.window_get_position()
			drag_offset = mouse_screen_pos - window_pos
		else:
			dragging = false
	
	elif event is InputEventMouseMotion and dragging:
		var mouse_screen_pos = DisplayServer.mouse_get_position()
		var new_window_pos = mouse_screen_pos - drag_offset
		DisplayServer.window_set_position(new_window_pos)
