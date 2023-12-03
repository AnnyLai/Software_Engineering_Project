extends Node

#const http_client = preload("res://HttpClient.tscn")
var url: String = "http://127.0.0.1:5000/"
#var url = "https://api.github.com/repos/godotengine/godot/releases/latest"

func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	
	
func request():
	$HTTPRequest.request(url)
	
func _on_request_completed(result, response_code, headers, body):#_on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)#["name"]
	print(json["status"])
	
	
func send():
	var data
	if Global.currentAction == 1:
		data = JSON.stringify(Global.login_args)
		#data = Global.login_func + data
	elif Global.currentAction == 2:
		data = JSON.stringify(Global.register_args)
		#data = Global.reg_func + data
	elif Global.currentAction == 3:
		data = JSON.stringify(Global.forgot_args)
		#data = Global.forgot_func + data
	
	var headers = ["Content-Type: application/json"]
	#var headers = ["Content-Type: application/x-www-form-urlencoded"]
	var SendError
	#var SendError = $HTTPRequest.request( Global.url+edata, headers, HTTPClient.METHOD_POST, "")
	if Global.currentAction == 1:
		SendError = $HTTPRequest.request( url+Global.login_func, headers, HTTPClient.METHOD_POST, data)
	elif Global.currentAction == 2:
		SendError = $HTTPRequest.request( url+Global.reg_func, headers, HTTPClient.METHOD_POST, data)
	elif Global.currentAction == 3:
		SendError = $HTTPRequest.request( url+Global.forgot_func, headers, HTTPClient.METHOD_POST, data)
		
	print("Error: ", SendError)
	


