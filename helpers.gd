class_name Helpers

static func is_left_mouse_click(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		return true
	return false

static func change_mouse_to_pointer():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

static func change_mouse_to_arrow():
	if Input.get_current_cursor_shape() != Input.CURSOR_ARROW:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)

