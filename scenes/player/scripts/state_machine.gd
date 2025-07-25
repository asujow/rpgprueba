class_name PlayerStateMachine extends Node

var states: Array[ State ]
var prev_state : State
var current_state : State


func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	pass
	
func change_state(new_state : State) -> void:
	if new_state == null or new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
	
	prev_state = current_state
	current_state = new_state
	current_state.enter()
	
func initialize(_player : Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
	if states.size() > 0:
		states[0].player = _player
		change_state( states[0] )
		process_mode = Node.PROCESS_MODE_INHERIT

func _process(delta):
	change_state( current_state.process( delta ) )
	pass

func _physics_process(delta):
	change_state( current_state.physics( delta ) )
	pass
	
func _unhandled_input(event):
	change_state( current_state.handleInput( event ) )
