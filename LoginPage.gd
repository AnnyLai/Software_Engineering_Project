extends Node2D

#var url: String = "https://127.0.0.1:5000/"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_log_in_pressed():
	if $InputBox/UserID.text != "" and $InputBox/Password.text != "":
		Global.login_args["username"] = $InputBox/UserID.text
		Global.login_args["password"] = $InputBox/Password.text
		print( "userID = " , Global.login_args["username"] )
		print( "password = " , Global.login_args["password"] )
		
		var newcall = load("res://CallRequest.tscn")
		var new = newcall.instantiate()
		add_child(new)
		#var client = Global.http_client.instantiate()
		#add_child(client)
		#client.HttpRequest(Global.url)
		get_tree().change_scene_to_file("res://MainPage.tscn")
	else:
		print( "not yet finished" )


func _on_next_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")


func _on_sign_up_pressed():
	get_tree().change_scene_to_file("res://SignUpPage.tscn")


func _on_forgotten_password_pressed():
	get_tree().change_scene_to_file("res://ForgottenPwPage.tscn")



