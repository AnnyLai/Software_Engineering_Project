extends Node2D

var userID = ""
var email = ""
var password = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_temp_pressed():
	get_tree().change_scene_to_file("res://StartPage.tscn")


func _on_sign_up_pressed():
	if $Password/InputBox.text != "" and $Password/InputBox.text == $CofirmPw/InputBox.text and $UserId/InputBox.text != "" and $Email/InputBox.text != "":
		userID = $UserId/InputBox.text
		email = $Email/InputBox.text
		password = $Password/InputBox.text
		print( "userID = " , userID )
		print( "email = " , email )
		print( "password = " , password )
	else:
		print( "not yet finished" )
