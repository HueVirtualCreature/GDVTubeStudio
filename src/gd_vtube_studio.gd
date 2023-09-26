extends Node

@export var app_author: String = "hue_vCreature";
@export var app_name: String = "GDVtubeStudio";
@export var app_base64_image: String = "";
@export var server_address = "ws://127.0.0.1:8001";
@export var authentication_token: String = "";

@onready var _client = $WebSocketClient;

signal client_response(message);

var _auto_connect: bool = false;

func start(_should_auto_connect = false):
	#Start the Client
	_initialize_websocket_client();
	_auto_connect = _should_auto_connect;
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

func request_model_load(arguments):
	client_response.emit(_log("Requesting model load"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ModelLoadRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_move_model(arguments):
	client_response.emit(_log("Requesting move model"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.MoveModelRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_hotkeys_in_current_model(arguments):
	client_response.emit(_log("Requesting hotkeys in current model"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.HotkeysInCurrentModelRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_hotkey_trigger(arguments):
	client_response.emit(_log("Requesting hotkey trigger"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.HotkeyTriggerRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_expression_state(arguments):
	client_response.emit(_log("Requesting expression state"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ExpressionStateRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_expression_activation(arguments):
	client_response.emit(_log("Requesting expression activation"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ExpressionActivationRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_art_mesh_list(arguments):
	client_response.emit(_log("Requesting art mesh list"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ArtMeshListRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_color_tint(arguments):
	client_response.emit(_log("Requesting color tint"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ColorTintRequest
	request.data.merge(arguments, true);
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

func request_parameter_value(arguments):
	client_response.emit(_log("Requesting parameter value"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ParameterValueRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_live2d_parameter_list():
	client_response.emit(_log("Requesting Live2D parameter list"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.Live2DParameterListRequest
	send_request(request)
	return

func request_parameter_creation(arguments):
	client_response.emit(_log("Requesting parameter creation"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ParameterCreationRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_parameter_deletion(arguments):
	client_response.emit(_log("Requesting parameter deletion"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ParameterDeletionRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_inject_parameter_data(arguments):
	client_response.emit(_log("Requesting inject parameter data"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.InjectParameterDataRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_get_current_model_physics():
	client_response.emit(_log("Requesting get current model physics"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.GetCurrentModelPhysicsRequest
	send_request(request)
	return

func request_set_current_model_physics(arguments):
	client_response.emit(_log("Requesting set current model physics"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.SetCurrentModelPhysicsRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_ndi_config(arguments):
	client_response.emit(_log("Requesting NDI config"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.NDIConfigRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_item_list(arguments):
	client_response.emit(_log("Requesting item list"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemListRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_item_load(arguments):
	client_response.emit(_log("Requesting item load"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemLoadRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_item_unload(arguments):
	client_response.emit(_log("Requesting item unload"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemUnloadRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_item_animation_control(arguments):
	client_response.emit(_log("Requesting item animation control"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemAnimationControlRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_item_move(arguments):
	client_response.emit(_log("Requesting item move"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ItemMoveRequest
	request.data.merge(arguments, true);
	send_request(request)
	return

func request_art_mesh_selection(arguments):
	client_response.emit(_log("Requesting art mesh selection"))
	var request = _get_base_request_model()
	request.messageType = RequestTypes.ArtMeshSelectionRequest
	request.data.merge(arguments, true);
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
		
	#Sanitize Request by removing blank, null props
	for key in request.data.keys():
		if (_isInvalid(request.data[key]) == true):
			request.data.erase(key);
			
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
	
	if (_auto_connect == true):
		request_authentication();
	return;
	
func _web_socket_on_data_recieved(response):
	var responseData = JSON.parse_string(response);
	client_response.emit(responseData);
	match (responseData.messageType):
		ResponseTypes.APIError:
			return;
		ResponseTypes.APIStateResponse:
			return;
		ResponseTypes.AuthenticationTokenResponse:
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

func _isInvalid(input) -> bool:
	if input == null: return true;
	if input is String && (input.lstrip(" ").rstrip(" ").length() == 0): return true;
	if input is int && input <= 0: return true;
	return false;
