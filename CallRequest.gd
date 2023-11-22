extends Node

#const http_client = preload("res://HttpClient.tscn")
var url: String = "http://127.0.0.1:5000/"
#var reg_func: String = 'register'
#var login_func: String = 'login'
#var register_args = {'username': 'c0xffee', 'password':'12345678', 'email':'haha@mail.com', 'nickname':'coffee'}
#var login_args = {'username': 'c0xffee', 'password':'12345678'}

func _ready():
	var data = JSON.stringify(Global.login_args)
	data = Global.login_func + data
	print(data)
	var edata = data.uri_encode()
	print(edata)
	
	var client = Global.http_client.instantiate()
	add_child(client)
	var error = client.Send(url, edata)
	print("Error: ", error)
	


