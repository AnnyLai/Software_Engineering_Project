extends Node2D

var userID = ""
var email = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_temp_pressed():
	get_tree().change_scene_to_file("res://StartPage.tscn")


func _on_send_pressed():
	if $InputBox/UserID.text != "" and $InputBox/Email.text != "":
		userID = $InputBox/UserID.text
		email = $InputBox/Email.text
		print( "userID = " , userID )
		print( "email = " , email )
	else:
		print( "not yet finished" )

