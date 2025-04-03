extends Button

var key:InputEventKey
var listening = false #when changing controlls we need to capture the next input

func _on_pressed():
	listening = true
	text = "listening..."

func _gui_input(event):
	if listening and event is InputEventKey:
		listening = false
		text = event.as_text_key_label()
		key = event
