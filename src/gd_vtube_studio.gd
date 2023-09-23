extends Node

@export var app_author: String = "hue_vCreature";
@export var app_name: String = "GDVtubeStudio";
@export var app_base64_image: String = "";
@export var server_address = "ws://127.0.0.1:8001";
var authentication_token: String = "";

@onready var _client = $WebSocketClient;

signal client_response(message);

func start(should_connect: bool = false):
	#Start the Client
	_initialize_websocket_client();
	return;

func start_connection():
	request_authentication_token();
	return;
	
func request_authentication_token():
	client_response.emit(_log("Requesting auth token"));
	var tokenRequest = _get_base_request_model();
	tokenRequest.messageType = RequestTypes.AuthenticationTokenRequest;
	send_request(tokenRequest);
	return;
	
func request_authentication():
	client_response.emit(_log("Requesting auth session"));
	var tokenRequest = _get_base_request_model();
	tokenRequest.messageType = RequestTypes.AuthenticationRequest;
	send_request(tokenRequest);
	return;

func request_api_state():
	client_response.emit(_log("Requesting API state"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.APIStateRequest
	send_request(request)
	return

func request_vts_folder_info():
	client_response.emit(_log("Requesting VTS folder info"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.VTSFolderInfoRequest
	send_request(request)
	return

func request_current_model():
	client_response.emit(_log("Requesting current model"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.CurrentModelRequest
	send_request(request)
	return

func request_available_models():
	client_response.emit(_log("Requesting available models"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.AvailableModelsRequest
	send_request(request)
	return

func request_model_load():
	client_response.emit(_log("Requesting model load"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ModelLoadRequest
	send_request(request)
	return

func request_move_model():
	client_response.emit(_log("Requesting move model"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.MoveModelRequest
	send_request(request)
	return

func request_hotkeys_in_current_model():
	client_response.emit(_log("Requesting hotkeys in current model"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.HotkeysInCurrentModelRequest
	send_request(request)
	return

func request_hotkey_trigger():
	client_response.emit(_log("Requesting hotkey trigger"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.HotkeyTriggerRequest
	send_request(request)
	return

func request_expression_state():
	client_response.emit(_log("Requesting expression state"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ExpressionStateRequest
	send_request(request)
	return

func request_expression_activation():
	client_response.emit(_log("Requesting expression activation"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ExpressionActivationRequest
	send_request(request)
	return

func request_art_mesh_list():
	client_response.emit(_log("Requesting art mesh list"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ArtMeshListRequest
	send_request(request)
	return

func request_color_tint():
	client_response.emit(_log("Requesting color tint"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ColorTintRequest
	send_request(request)
	return

func request_scene_color_overlay_info():
	client_response.emit(_log("Requesting scene color overlay info"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.SceneColorOverlayInfoRequest
	send_request(request)
	return

func request_face_found():
	client_response.emit(_log("Requesting face found"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.FaceFoundRequest
	send_request(request)
	return

func request_input_parameter_list():
	client_response.emit(_log("Requesting input parameter list"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.InputParameterListRequest
	send_request(request)
	return

func request_parameter_value():
	client_response.emit(_log("Requesting parameter value"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ParameterValueRequest
	send_request(request)
	return

func request_live2d_parameter_list():
	client_response.emit(_log("Requesting Live2D parameter list"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.Live2DParameterListRequest
	send_request(request)
	return

func request_parameter_creation():
	client_response.emit(_log("Requesting parameter creation"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ParameterCreationRequest
	send_request(request)
	return

func request_parameter_deletion():
	client_response.emit(_log("Requesting parameter deletion"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ParameterDeletionRequest
	send_request(request)
	return

func request_inject_parameter_data():
	client_response.emit(_log("Requesting inject parameter data"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.InjectParameterDataRequest
	send_request(request)
	return

func request_get_current_model_physics():
	client_response.emit(_log("Requesting get current model physics"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.GetCurrentModelPhysicsRequest
	send_request(request)
	return

func request_set_current_model_physics():
	client_response.emit(_log("Requesting set current model physics"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.SetCurrentModelPhysicsRequest
	send_request(request)
	return

func request_ndi_config():
	client_response.emit(_log("Requesting NDI config"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.NDIConfigRequest
	send_request(request)
	return

func request_item_list():
	client_response.emit(_log("Requesting item list"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemListRequest
	send_request(request)
	return

func request_item_load():
	client_response.emit(_log("Requesting item load"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemLoadRequest
	send_request(request)
	return

func request_item_unload():
	client_response.emit(_log("Requesting item unload"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemUnloadRequest
	send_request(request)
	return

func request_item_animation_control():
	client_response.emit(_log("Requesting item animation control"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemAnimationControlRequest
	send_request(request)
	return

func request_item_move():
	client_response.emit(_log("Requesting item move"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemMoveRequest
	send_request(request)
	return

func request_art_mesh_selection():
	client_response.emit(_log("Requesting art mesh selection"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ArtMeshSelectionRequest
	send_request(request)
	return

func request_vtubestudio_api_state_broadcast():
	client_response.emit(_log("Requesting VTubeStudio API state broadcast"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.VTubeStudioAPIStateBroadcast
	send_request(request)
	return
	
func send_request(request):
	if (authentication_token != null && authentication_token != ""):
		request.data.authenticationToken = authentication_token;
	var json_string = JSON.stringify(request);
	_client.send(json_string);
	return;
	
func _initialize_websocket_client():
	client_response.emit(_log("Initializing client..."));
	
	# Connect base signals to get notified of connection open, close, and errors.
	_client.closed.connect(_web_socket_closed);
	_client.connect_failed.connect(_web_socket_closed);
	_client.connected.connect(_web_socket_connected);
	_client.received.connect(_web_socket_on_data_recieved);
	client_response.emit(_log("Attached client signals..."));
	
	# Connect to the WebSocket server
	_client.connect_socket(server_address);
	client_response.emit(_log("Waiting for response..."));
	return;

func _web_socket_closed():
	client_response.emit(_log("Response > The client connection was closed"));
	return;
	
func _web_socket_connected(message):
	client_response.emit(_log("Response > Client connected (" + message + ")"));
	return;
	
func _web_socket_on_data_recieved(response):
	var responseData = JSON.parse_string(response);
	client_response.emit(responseData.data);
	match (responseData.messageType):
		ResponseTypes.APIError:
			return;
		ResponseTypes.APIStateResponse:
			return;
		ResponseTypes.AuthenticationTokenResponse:
			if (responseData.data.authenticationToken != null):
				authentication_token = responseData.data.authenticationToken;
			return;
		ResponseTypes.AuthenticationResponse:
			return;
		ResponseTypes.StatisticsResponse:
			return;
		ResponseTypes.VTSFolderInfoResponse:
			return;
		ResponseTypes.CurrentModelResponse:
			return;
		ResponseTypes.AvailableModelsResponse:
			return;
		ResponseTypes.ModelLoadResponse:
			return;
		ResponseTypes.MoveModelResponse:
			return;
		ResponseTypes.HotkeysInCurrentModelResponse:
			return;
		ResponseTypes.HotkeyTriggerResponse:
			return;
		ResponseTypes.ExpressionStateResponse:
			return;
		ResponseTypes.ExpressionActivationResponse:
			return;
		ResponseTypes.ArtMeshListResponse:
			return;
		ResponseTypes.ColorTintResponse:
			return;
		ResponseTypes.SceneColorOverlayInfoResponse:
			return;
		ResponseTypes.FaceFoundResponse:
			return;
		ResponseTypes.InputParameterListResponse:
			return;
		ResponseTypes.ParameterValueResponse:
			return;
		ResponseTypes.Live2DParameterListResponse:
			return;
		ResponseTypes.ParameterCreationResponse:
			return;
		ResponseTypes.ParameterDeletionResponse:
			return;
		ResponseTypes.InjectParameterDataResponse:
			return;
		ResponseTypes.GetCurrentModelPhysicsResponse:
			return;
		ResponseTypes.SetCurrentModelPhysicsResponse:
			return;
		ResponseTypes.NDIConfigResponse:
			return;
		ResponseTypes.ItemListResponse:
			return;
		ResponseTypes.ItemLoadResponse:
			return;
		ResponseTypes.ItemUnloadResponse:
			return;
		ResponseTypes.ItemAnimationControlResponse:
			return;
		ResponseTypes.ItemMoveResponse:
			return;
		ResponseTypes.ArtMeshSelectionResponse:
			return;
	return;

func _get_base_request_model():
	return {
		"apiName" : "VTubeStudioPublicAPI",
		"apiVersion": "1.0",
		#"requestID": null,
		"messageType": null,
		"data": {
			"pluginName": app_name,
			"pluginDeveloper": app_author,
			"pluginIcon": app_base64_image
		}
	}

func _log(message):
	return Time.get_datetime_string_from_system() + " - " + message;
