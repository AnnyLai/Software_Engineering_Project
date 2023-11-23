extends Node2D

var set

# Called when the node enters the scene tree for the first time.
func _ready():
	$Left.visible = false
	$Bottom.visible = false
	$Right.visible = false
	$Top.visible = false


func _on_settings_pressed():
	var setting = load("res://Settings.tscn")
	set = setting.instantiate()
	set.scale = Vector2(0.77,0.77)
	$".".add_child(set)
	$Left.visible = true
	$Bottom.visible = true
	$Right.visible = true
	$Top.visible = true
	

func _on_left_pressed():
	$".".remove_child(set)
	$Left.visible = false
	$Bottom.visible = false
	$Right.visible = false
	$Top.visible = false

func _on_bottom_pressed():
	$".".remove_child(set)
	$Left.visible = false
	$Bottom.visible = false
	$Right.visible = false
	$Top.visible = false

func _on_right_pressed():
	$".".remove_child(set)
	$Left.visible = false
	$Bottom.visible = false
	$Right.visible = false
	$Top.visible = false

func _on_top_pressed():
	$".".remove_child(set)
	$Left.visible = false
	$Bottom.visible = false
	$Right.visible = false
	$Top.visible = false
