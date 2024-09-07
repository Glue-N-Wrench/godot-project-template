extends Button

func _ready():
	$Popup.hide()

func _on_pressed():
	$Popup.hide()#hide to reset window position
	$Popup.show()
