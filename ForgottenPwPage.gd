extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ResetPwLabel.visible = true
	$Verify.visible = false
	$ResetPassword.visible = false
	$Directions.visible = true
	$SendEmail.visible = true
	$Send.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_temp_pressed():
	get_tree().change_scene_to_file("res://StartPage.tscn")


func _on_send_pressed():
	if $SendEmail/Email.text != "":
		#Global.forgot_args["username"] = $Whole/InputBox/UserID.text
		Global.forgot_args["email"] = $SendEmail/Email.text
		#print( "userID = " , Global.forgot_args["username"] )
		#print( "email = " , Global.forgot_args["email"] )
		Global.currentAction = 3
		var newcall = load("res://HttpRequest.tscn")
		var new = newcall.instantiate()
		add_child(new)
		new.send()
		#new = newcall.instantiate()
		#add_child(new)
		#new.request()
		await get_tree().create_timer(2).timeout
		if Global.response["status"] == "Successful":
			remove_child(new)
			$Verify.visible = true
			$ResetPassword.visible = true
			$Directions.visible = false
			$SendEmail.visible = false
			$Send.visible = false
	else:
		print( "not yet finished" )




func _on_reset_password_pressed():
	if $Verify/InputBox/VSplitContainer/Email.text != "" and $Verify/InputBox/VSplitContainer/NewPassword.text != "" and $Verify/InputBox/VertifyCode.text != "":
		Global.verify_args["email"] = $Verify/InputBox/VSplitContainer/Email.text
		Global.verify_args["password"] = $Verify/InputBox/VSplitContainer/NewPassword.text
		Global.verify_args["vcode"] = $Verify/InputBox/VertifyCode.text
		#print( "userID = " , Global.forgot_args["username"] )
		#print( "email = " , Global.forgot_args["email"] )
		Global.currentAction = 4
		var newcall = load("res://HttpRequest.tscn")
		var new = newcall.instantiate()
		add_child(new)
		new.send()
		#new = newcall.instantiate()
		#add_child(new)
		#new.request()
		await get_tree().create_timer(2).timeout
		print(Global.response)
		if Global.response["status"] == "Password changing is successful":
			remove_child(new)
			get_tree().change_scene_to_file("res://LoginPage.tscn")
	else:
		print( "not yet finished" )
