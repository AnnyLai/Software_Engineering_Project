extends ParallaxBackground

var scrolling_speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= scrolling_speed * delta


func _on_button_pressed():
	Utils.saveGame()
	get_tree().change_scene_to_file("res://main.tscn")
