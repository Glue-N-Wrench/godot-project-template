extends Button

@onready var packedLevel = load("res://PlayableScenes/MainLevel.tscn")

func _on_pressed():
	get_tree().change_scene_to_packed(packedLevel)
