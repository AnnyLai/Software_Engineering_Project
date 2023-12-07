extends Node2D

#var url: String = "https://127.0.0.1:5000/"

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_tree().set_screen_stretch()
	pass

func _on_log_in_pressed():
	if $InputBox/UserID.text != "" and $InputBox/Password.text != "":
		Global.login_args["username"] = $InputBox/UserID.text
		Global.login_args["password"] = $InputBox/Password.text
		#print( "userID = " , Global.login_args["username"] )
		#print( "password = " , Global.login_args["password"] )
		Global.currentAction = 1
		var newcall = load("res://HttpRequest.tscn")
		var new = newcall.instantiate()
		add_child(new)
		new.send()
		#new._ready()
		#new._on_request_completed(result, response_code, headers, body)
		#var client = Global.http_client.instantiate()
		#add_child(client)
		#client.HttpRequest(Global.url)
		await get_tree().create_timer(2).timeout
		print("2: ",Global.response)
		if Global.response["status"] == "Successful Login":
			remove_child(new)
			get_tree().change_scene_to_file("res://MainPage.tscn")
		else:
			print( "Username or Password inncorrect" )
	else:
		print( "not yet finished" )


func _on_next_pressed():
	get_tree().change_scene_to_file("res://MainPage.tscn")


func _on_sign_up_pressed():
	get_tree().change_scene_to_file("res://SignUpPage.tscn")


func _on_forgotten_password_pressed():
	get_tree().change_scene_to_file("res://ForgottenPwPage.tscn")



