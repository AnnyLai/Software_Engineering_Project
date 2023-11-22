extends Node2D

var userID = ""
var password = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_log_in_pressed():
	if $InputBox/UserID.text != "" and $InputBox/Password.text != "":
		userID = $InputBox/UserID.text
		password = $InputBox/Password.text
		print( "userID = " , userID )
		print( "password = " , password )
		get_tree().change_scene_to_file("res://MainPage.tscn")
	else:
		print( "not yet finished" )


func _on_next_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")


func _on_sign_up_pressed():
	get_tree().change_scene_to_file("res://SignUpPage.tscn")


func _on_forgotten_password_pressed():
	get_tree().change_scene_to_file("res://ForgottenPwPage.tscn")



