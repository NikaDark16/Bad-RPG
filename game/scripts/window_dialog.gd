extends WindowDialog


func _ready():
	get_close_button().connect("button_down", get_node(".."), "_on_ButtonNo_button_down")