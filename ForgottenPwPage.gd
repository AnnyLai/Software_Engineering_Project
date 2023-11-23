extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_temp_pressed():
	get_tree().change_scene_to_file("res://StartPage.tscn")


func _on_send_pressed():
	if $Whole/InputBox/UserID.text != "" and $Whole/InputBox/Email.text != "":
		Global.forgot_args["username"] = $Whole/InputBox/UserID.text
		Global.forgot_args["email"] = $Whole/InputBox/Email.text
		print( "userID = " , Global.forgot_args["username"] )
		print( "email = " , Global.forgot_args["email"] )
		#var newcall = load("res://CallRequest.tscn")
		#var new = newcall.instantiate()
		#add_child(new)
		get_tree().change_scene_to_file("res://LoginPage.tscn")
	else:
		print( "not yet finished" )

