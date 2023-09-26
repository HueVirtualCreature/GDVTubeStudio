# GDVTubeStudio

GDVTubeStudio is a project designed for use with Godot 4, serving as an API wrapper for the software VTubeStudio by Denchisoft. By instantiating an instance of GDVtubeStudio and calling its member functions, you can easily interact with VTubeStudio's features.

## Getting Started

1. **Installation:** To get started, Ensure you have Godot 4 installed and configured. Import the GDVtubeStudio scene into your Godot project and instantiate an instance of the scene as a node. 

2. **Initialization:** Call the `start()` function to initialize the GDVTubeStudio client. You can specify whether it should auto-connect to the VTubeStudio API.
The function, start(), by itself, just spins up a WebsocketPeer. 
If you decide to enable auto-connect, then make sure you have supplied an authentication token to GDVTubeStudio, first.

```gdscript
var some_token = "123412341324134134" #It is up to your implemntation to determine how to save and retrieve existing tokens. Please refer to the demo app for an example.
$GDVtubeStudio.authentication_token = some_token;

# Start GDVTubeStudio client
GDVtubeStudio.start(should_auto_connect)
```

3. **Authentication:** You can request an authentication token or session to interact with VTubeStudio. Use the following functions:

- `request_authentication_token()`: Request an authentication token.
- `request_authentication()`: Request an authentication session. You cannot request a authenticated session without an authentication token.

```gdscript
# Request authentication token
GDVtubeStudio.request_authentication_token()

# Request authentication session
GDVtubeStudio.request_authentication()
```

## Available Functions

Here's a list of available functions in GDVTubeStudio:

- `request_api_state()`: Request VTubeStudio API state.
- `request_vts_folder_info()`: Request VTubeStudio folder information.
- `request_current_model()`: Request the current model.
- `request_available_models()`: Request available models.
- `request_model_load(arguments)`: Request model load with optional arguments.
- `request_move_model(arguments)`: Request moving a model with optional arguments.
- `request_hotkeys_in_current_model(arguments)`: Request hotkeys in the current model with optional arguments.
- `request_hotkey_trigger(arguments)`: Request hotkey trigger with optional arguments.
- `request_expression_state(arguments)`: Request expression state with optional arguments.
- `request_expression_activation(arguments)`: Request expression activation with optional arguments.
- `request_art_mesh_list(arguments)`: Request art mesh list with optional arguments.
- `request_color_tint(arguments)`: Request color tint with optional arguments.
- `request_scene_color_overlay_info()`: Request scene color overlay information.
- `request_face_found()`: Request face found information.
- `request_input_parameter_list()`: Request input parameter list.
- `request_parameter_value(arguments)`: Request parameter value with optional arguments.
- `request_live2d_parameter_list()`: Request Live2D parameter list.
- `request_parameter_creation(arguments)`: Request parameter creation with optional arguments.
- `request_parameter_deletion(arguments)`: Request parameter deletion with optional arguments.
- `request_inject_parameter_data(arguments)`: Request injecting parameter data with optional arguments.
- `request_get_current_model_physics()`: Request getting current model physics.
- `request_set_current_model_physics(arguments)`: Request setting current model physics with optional arguments.
- `request_ndi_config(arguments)`: Request NDI config with optional arguments.
- `request_item_list(arguments)`: Request item list with optional arguments.
- `request_item_load(arguments)`: Request item load with optional arguments.
- `request_item_unload(arguments)`: Request item unload with optional arguments.
- `request_item_animation_control(arguments)`: Request item animation control with optional arguments.
- `request_item_move(arguments)`: Request moving an item with optional arguments.
- `request_art_mesh_selection(arguments)`: Request art mesh selection with optional arguments.
- `request_vtubestudio_api_state_broadcast()`: Request VTubeStudio API state broadcast.

## Usage

You can call these functions in your Godot project by including the GDVtubeStudio node and invoking the respective functions as needed.

```gdscript
# Example usage of GDVTubeStudio functions
GDVtubeStudio.request_current_model()
```

None of the functions return a value. If the API returns a response, it will be returned with the signal "client_response"
```gdscript
...
GDVtubeStudio.connected.client_response(_on_gd_vtube_studio_server_response);
...

func _on_gd_vtube_studio_server_response(message):
	#message is the contents of the response object
```

## Contributions

Contributions to GDVTubeStudio are welcome. Feel free to open issues or submit pull requests to improve and expand its functionality.

## License

GDVTubeStudio is licensed under the [GNU GENERAL PUBLIC LICENSE](LICENSE).

---