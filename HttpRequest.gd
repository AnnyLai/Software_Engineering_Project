extends Node

#const http_client = preload("res://HttpClient.tscn")
var url: String = "http://127.0.0.1:5000/"
#var url = "https://api.github.com/repos/godotengine/godot/releases/latest"

func _ready():
	'''
	var login_url = "http://127.0.0.1:5000/login"
	# Create an HTTP request node and connect its completion signal.
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)

	# Perform a POST request. The URL below returns JSON as of writing.
	# Note: Don't make simultaneous requests using a single HTTPRequest node.
	# The snippet below is provided for reference only.
	var headers = ["Content-Type: application/json"]
	var body = JSON.new().stringify({"username": "abc", "password": "123"})
	var error = http_request.request(login_url, headers, HTTPClient.METHOD_POST, body)
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	'''
	
func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	Global.response = json.get_data()
	#Global.response = json["status"]
	# Will print the user agent string used by the HTTPRequest node (as recognized by httpbin.org).
	#print(response.headers["User-Agent"])	
	print("1: ",Global.response)
	
func request():
	$HTTPRequest.request(url)
	
func _on_request_completed(result, response_code, headers, body):#_on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)#["name"]
	print(json["status"])
	
	
func send():
	var body
	if Global.currentAction == 1:
		body = JSON.stringify(Global.login_args)
		#data = Global.login_func + data
	elif Global.currentAction == 2:
		body = JSON.stringify(Global.register_args)
		#data = Global.reg_func + data
	elif Global.currentAction == 3:
		body = JSON.stringify(Global.forgot_args)
		#data = Global.forgot_func + data
	elif Global.currentAction == 4:
		body = JSON.stringify(Global.verify_args)
	
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.timeout = 20000
	http_request.request_completed.connect(self._http_request_completed)
	
	var headers = ["Content-Type: application/json"]
	var error
	if Global.currentAction == 1:
		error = http_request.request( url+Global.login_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 2:
		error = http_request.request( url+Global.reg_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 3:
		error = http_request.request( url+Global.forgot_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 4:
		error = http_request.request( url+Global.verify_func, headers, HTTPClient.METHOD_POST, body)
		
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	print("Error: ", error)
	await get_tree().create_timer(1.5).timeout
	remove_child(http_request)


