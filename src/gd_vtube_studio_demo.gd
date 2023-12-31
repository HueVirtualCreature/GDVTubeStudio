extends Node
var authentication_token: String = "";

func _ready():
	#This is an example of how one might load an existing authentication token
	#for VTubeStudio, from a prior session
	#This saves you the trouble of needing to ask for a new token each time
	if (FileAccess.file_exists("user://GDVTS_demo.dat")):
		var file = FileAccess.open("user://GDVTS_demo.dat", FileAccess.READ)
		var content = file.get_as_text()
		file.close();
		if (content != null && content != ""):
			$GDVtubeStudio.authentication_token = content;
	$GDVtubeStudio.start(true);
	return;

func _on_gd_vtube_studio_server_response(message):
	if (message is Dictionary):
		$VBoxContainer/Log.append_text("\n"+ "[color=#00FF00]" + _format_dict(message) + "[/color]");
	else:
		$VBoxContainer/Log.add_text("\n"+str(message));
	
	if (message is Dictionary):
		match (message.messageType):
			#This is an example of how one might save the authentication token,
			#once it has been retrieved from VTubeStudio
			ResponseTypes.AuthenticationTokenResponse:
				if (message.data.authenticationToken):
					authentication_token = message.data.authenticationToken;
					$GDVtubeStudio.authentication_token = authentication_token;
					var file = FileAccess.open("user://GDVTS_demo.dat", FileAccess.WRITE)
					file.store_string(authentication_token);
					file.close()
	return;
	
func _on_request_api_state_pressed():
	$GDVtubeStudio.request_api_state()
	return

func _on_request_authentication_token_pressed():
	$GDVtubeStudio.request_authentication_token()
	return

func _on_request_authentication_pressed():
	$GDVtubeStudio.request_authentication()
	return

func _on_request_vts_folder_info_pressed():
	$GDVtubeStudio.request_vts_folder_info()
	return

func _on_request_current_model_pressed():
	$GDVtubeStudio.request_current_model()
	return

func _on_request_available_models_pressed():
	$GDVtubeStudio.request_available_models()
	return

func _on_request_model_load_pressed():
	var request = RequestTypes.ModelLoadRequestArguments;
	request.modelID = "17feb73471fe4601b06e48ee2add1fe3";
	$GDVtubeStudio.request_model_load(request)
	return

func _on_request_move_model_pressed():
	var request = RequestTypes.MoveModelRequestArguments;
	$GDVtubeStudio.request_move_model(request);
	return

func _on_request_hotkeys_in_current_model_pressed():
	var request = RequestTypes.HotkeysInCurrentModelRequestArguments;
	$GDVtubeStudio.request_hotkeys_in_current_model(request)
	return

func _on_request_hotkey_trigger_pressed():
	$GDVtubeStudio.request_hotkey_trigger()
	return

func _on_request_expression_state_pressed():
	$GDVtubeStudio.request_expression_state()
	return

func _on_request_expression_activation_pressed():
	$GDVtubeStudio.request_expression_activation()
	return

func _on_request_art_mesh_list_pressed():
	$GDVtubeStudio.request_art_mesh_list()
	return

func _on_request_color_tint_pressed():
	$GDVtubeStudio.request_color_tint()
	return

func _on_request_scene_color_overlay_info_pressed():
	$GDVtubeStudio.request_scene_color_overlay_info()
	return

func _on_request_face_found_pressed():
	$GDVtubeStudio.request_face_found()
	return

func _on_request_input_parameter_list_pressed():
	$GDVtubeStudio.request_input_parameter_list()
	return

func _on_request_parameter_value_pressed():
	$GDVtubeStudio.request_parameter_value()
	return

func _on_request_live2d_parameter_list_pressed():
	$GDVtubeStudio.request_live2d_parameter_list()
	return

func _on_request_parameter_creation_pressed():
	$GDVtubeStudio.request_parameter_creation()
	return

func _on_request_parameter_deletion_pressed():
	$GDVtubeStudio.request_parameter_deletion()
	return

func _on_request_inject_parameter_data_pressed():
	$GDVtubeStudio.request_inject_parameter_data()
	return

func _on_request_get_current_model_physics_pressed():
	$GDVtubeStudio.request_get_current_model_physics()
	return

func _on_request_set_current_model_physics_pressed():
	$GDVtubeStudio.request_set_current_model_physics()
	return

func _on_request_ndi_config_pressed():
	$GDVtubeStudio.request_ndi_config()
	return

func _on_request_item_list_pressed():
	$GDVtubeStudio.request_item_list()
	return

func _on_request_item_load_pressed():
	$GDVtubeStudio.request_item_load()
	return

func _on_request_item_unload_pressed():
	$GDVtubeStudio.request_item_unload()
	return

func _on_request_item_animation_control_pressed():
	$GDVtubeStudio.request_item_animation_control()
	return

func _on_request_item_move_pressed():
	$GDVtubeStudio.request_item_move()
	return

func _on_request_art_mesh_selection_pressed():
	$GDVtubeStudio.request_art_mesh_selection()
	return

func _on_request_vtubestudio_api_state_broadcast_pressed():
	$GDVtubeStudio.request_vtubestudio_api_state_broadcast()
	return

func _on_request_event_subscription_pressed():
	var request = RequestTypes.EventSubscriptionRequestArguments;
	request.eventName = "ModelMovedEvent"
	request.subscribe = true
	$GDVtubeStudio.request_event_subscription(request)
	return
	
func _format_dict(dict, indent_level = 0):
	var formatted_str = ""
	var indentation = "\t".repeat(indent_level)

	for key in dict.keys():
		var value = dict[key]

		if value is Dictionary:
			formatted_str += indentation + key + ":\n"
			formatted_str += _format_dict(value, indent_level + 1)
		elif value is Array:
			formatted_str += indentation + key + ":\n"
			var counter = 0;
			for item in value:
				if item is Dictionary:
					formatted_str += indentation + str(counter) + ":\n"
					formatted_str += _format_dict(item, indent_level + 1)
				else:
					formatted_str += indentation + "\t- " + str(item) + "\n"
				counter += 1;
		else:
			formatted_str += indentation + key + ": " + str(value) + "\n"

	return formatted_str
