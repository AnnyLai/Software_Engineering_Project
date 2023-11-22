extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func HttpRequest(url):
	$HTTPRequest.request(url)

func _on_request_completed(result, response_code, headers, body):#_on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)

func Send( url, data_to_send):
	#var json = JSON.stringify(data_to_send)
	var headers = ["Content-Type: application/json"]
	var SentError = $HTTPRequest.request( url+data_to_send, headers, HTTPClient.METHOD_POST, "")
	#var SentError = $HTTPRequest.request( url+data_to_send, headers, HTTPClient.METHOD_POST, "")
	#print(url+data_to_send)
	#$HTTPRequest.request(url, ["User-Agent: YourCustomUserAgent"])
	return SentError
