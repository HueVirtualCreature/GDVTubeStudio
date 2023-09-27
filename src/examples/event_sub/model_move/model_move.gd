extends Node2D

var authentication_token: String = "";

func _ready():
	$GDVtubeStudio.client_response.connect(_on_gd_vtube_studio_server_response);
	if (FileAccess.file_exists("user://GDVTS_demo.dat")):
		var file = FileAccess.open("user://GDVTS_demo.dat", FileAccess.READ)
		var content = file.get_as_text()
		file.close();
		if (content != null && content != ""):
			$GDVtubeStudio.authentication_token = content;
	$GDVtubeStudio.start(true);
	return;

func _on_gd_vtube_studio_server_response(message):
	print(message);
	if (message is Dictionary):
		match (message.messageType):
			ResponseTypes.AuthenticationTokenResponse:
				if (message.data.authenticationToken):
					authentication_token = message.data.authenticationToken;
					$GDVtubeStudio.authentication_token = authentication_token;
					var file = FileAccess.open("user://GDVTS_demo.dat", FileAccess.WRITE)
					file.store_string(authentication_token);
					file.close()
					$GDVtubeStudio.request_authentication();
			ResponseTypes.AuthenticationResponse:
				if (message.data.authenticated == false):
					$GDVtubeStudio.request_authentication_token()
					return;
				#When ready, subscribe
				_request_event_subscription();
			ResponseTypes.ModelMovedEvent:
				var client_size = get_viewport().size;
				var upper_bound_width = client_size.x;
				var upper_bound_height = client_size.y;
				var converted_x = (message.data.modelPosition.positionX + 1) * (upper_bound_width / 2);
				var converted_y = (1 - message.data.modelPosition.positionY) * (upper_bound_height / 2);
				$Recticle.position = Vector2(converted_x, converted_y);
	return;

func _request_event_subscription():
	var request = RequestTypes.EventSubscriptionRequestArguments;
	request.eventName = "ModelMovedEvent"
	request.subscribe = true
	$GDVtubeStudio.request_event_subscription(request)
	return
