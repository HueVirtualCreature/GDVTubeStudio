extends Node

var socket = WebSocketPeer.new()
@export var url = "ws://127.0.0.1:8001"

var socket_state: int = WebSocketPeer.STATE_CLOSED;
var should_auto_connect: bool = true;

signal connected(url)
signal connect_failed
signal received(data)
signal closing
signal closed(code, reason)

func _ready():
	return;
	
func connect_socket(url):
	socket.connect_to_url(url);
	
func send(message):
	socket.send_text(message);
	
func _process(_delta):
	socket.poll()
	var state = socket.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		if (state != socket_state):
			socket_state = state; 
			connected.emit(url);
		if socket.get_available_packet_count(): 
			var msg = socket.get_packet().get_string_from_utf8();
			received.emit(msg);
	elif state == WebSocketPeer.STATE_CONNECTING:
		if (state != socket_state):
			socket_state = state; 
		return;
	elif state == WebSocketPeer.STATE_CLOSING:
		if (state != socket_state):
			socket_state = state; 
			closing.emit();
		return;
	elif state == WebSocketPeer.STATE_CLOSED:
		if (state != socket_state):
			socket_state = state; 
			closed.emit(null, null);
		if (should_auto_connect):	socket.connect_to_url(url)
