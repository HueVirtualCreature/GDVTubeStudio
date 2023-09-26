# GDVTubeStudio

GDVTubeStudio is a project designed for use with Godot 4, serving as an API wrapper for the software VTubeStudio by Denchisoft. By instantiating an instance of GDVtubeStudio and calling its member functions, you can easily interact with VTubeStudio's features.

## Getting Started

1. **Installation:** To get started, Ensure you have Godot 4 installed and configured. Import the GDVtubeStudio scene into your Godot project and instantiate an instance of the scene as a node. 

2. **Initialization:** Call the `start()` function to initialize the GDVTubeStudio client. You can specify whether it should auto-connect to the VTubeStudio API.
The function, start(), by itself, just spins up a WebsocketPeer. 
If you decide to enable auto-connect, then make sure you have supplied an authentication token to GDVTubeStudio, first.

```gdscript
#It is up to your implementation to determine how to save and 
#retrieve existing tokens. Please refer to the demo app for an example.
var some_token = "123412341324134134"
$GDVtubeStudio.authentication_token = some_token;

# Start GDVTubeStudio client
GDVtubeStudio.start(should_auto_connect)
```

3. **Authentication:** You can request an authentication token or session to interact with VTubeStudio. Use the following functions:

- `request_authentication_token()`: Request an authentication token.
- `request_authentication()`: Request an authentication session. You cannot request a authenticated session without an authentication token.

```gdscript
# Request authentication token
#This function will automatically assign a value to $GDVtubeStudio.authentication_token
GDVtubeStudio.request_authentication_token()

# Request authentication session
GDVtubeStudio.request_authentication()
```

## Available Functions

Here's a list of available functions in GDVTubeStudio and references to the Denchisoft API Documentation. Please refer to their documenation for more information about each request type:

- `request_api_state()`: https://github.com/DenchiSoft/VTubeStudio#api-details
- `request_vts_folder_info()`: https://github.com/DenchiSoft/VTubeStudio#getting-list-of-vts-folders
- `request_current_model()`: https://github.com/DenchiSoft/VTubeStudio#getting-the-currently-loaded-model
- `request_available_models()`: https://github.com/DenchiSoft/VTubeStudio#getting-a-list-of-available-vts-models
- `request_model_load(arguments)`: https://github.com/DenchiSoft/VTubeStudio#loading-a-vts-model-by-its-id
- `request_move_model(arguments)`: https://github.com/DenchiSoft/VTubeStudio#moving-the-currently-loaded-vts-model
- `request_hotkeys_in_current_model(arguments)`: https://github.com/DenchiSoft/VTubeStudio#requesting-list-of-hotkeys-available-in-current-or-other-vts-model
- `request_hotkey_trigger(arguments)`: https://github.com/DenchiSoft/VTubeStudio#requesting-execution-of-hotkeys
- `request_expression_state(arguments)`: https://github.com/DenchiSoft/VTubeStudio#requesting-current-expression-state-list
- `request_expression_activation(arguments)`: https://github.com/DenchiSoft/VTubeStudio#requesting-activation-or-deactivation-of-expressions
- `request_art_mesh_list(arguments)`: https://github.com/DenchiSoft/VTubeStudio#requesting-list-of-artmeshes-in-current-model
- `request_color_tint(arguments)`: https://github.com/DenchiSoft/VTubeStudio#tint-artmeshes-with-color
- `request_scene_color_overlay_info()`: https://github.com/DenchiSoft/VTubeStudio#getting-scene-lighting-overlay-color
- `request_face_found()`: https://github.com/DenchiSoft/VTubeStudio#checking-if-face-is-currently-found-by-tracker
- `request_input_parameter_list()`: https://github.com/DenchiSoft/VTubeStudio#requesting-list-of-available-tracking-parameters
- `request_parameter_value(arguments)`: https://github.com/DenchiSoft/VTubeStudio#get-the-value-for-one-specific-parameter-default-or-custom
- `request_live2d_parameter_list()`: https://github.com/DenchiSoft/VTubeStudio#get-the-value-for-all-live2d-parameters-in-the-current-model
- `request_parameter_creation(arguments)`: https://github.com/DenchiSoft/VTubeStudio#adding-new-tracking-parameters-custom-parameters
- `request_parameter_deletion(arguments)`: https://github.com/DenchiSoft/VTubeStudio#delete-custom-parameters
- `request_inject_parameter_data(arguments)`: https://github.com/DenchiSoft/VTubeStudio#feeding-in-data-for-default-or-custom-parameters
- `request_get_current_model_physics()`: https://github.com/DenchiSoft/VTubeStudio#getting-physics-settings-of-currently-loaded-vts-model
- `request_set_current_model_physics(arguments)`: https://github.com/DenchiSoft/VTubeStudio#overriding-physics-settings-of-currently-loaded-vts-model
- `request_ndi_config(arguments)`: https://github.com/DenchiSoft/VTubeStudio#get-and-set-ndi-settings
- `request_item_list(arguments)`: https://github.com/DenchiSoft/VTubeStudio#requesting-list-of-available-items-or-items-in-scene
- `request_item_load(arguments)`: https://github.com/DenchiSoft/VTubeStudio#loading-item-into-the-scene
- `request_item_unload(arguments)`: https://github.com/DenchiSoft/VTubeStudio#removing-item-from-the-scene
- `request_item_animation_control(arguments)`: https://github.com/DenchiSoft/VTubeStudio#controling-items-and-item-animations
- `request_item_move(arguments)`: https://github.com/DenchiSoft/VTubeStudio#moving-items-in-the-scene
- `request_art_mesh_selection(arguments)`: https://github.com/DenchiSoft/VTubeStudio#asking-user-to-select-artmeshes
- `request_vtubestudio_api_state_broadcast()`: https://github.com/DenchiSoft/VTubeStudio#api-server-discovery-udp

## Usage

You can call these functions in your Godot project by including the GDVtubeStudio node and invoking the respective functions as needed.

```gdscript
# Example usage of GDVTubeStudio functions
GDVtubeStudio.request_current_model()
```

None of the functions return a value. If the API returns a response, it will be returned with the signal "client_response"
```gdscript
...
GDVtubeStudio.client_response.connect(_on_gd_vtube_studio_server_response);
...

func _on_gd_vtube_studio_server_response(message):
	#message is the contents of the response object
```

## Contributions

Contributions to GDVTubeStudio are welcome. Feel free to open issues or submit pull requests to improve and expand its functionality.

## License

GDVTubeStudio is licensed under the [GNU GENERAL PUBLIC LICENSE](LICENSE).

---