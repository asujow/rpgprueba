class_name State_Walk extends State

static var state_name: String = "walk"
@export var move_speed : float = 100.0
@onready var idle: State = $"../Idle"

#Cuando entra en el estado
func enter() -> void:
	player.update_animation(state_name)
	pass
	
func exit() -> void:
	pass
	
func process(_delta : float) -> State:
	if player.direccion == Vector2.ZERO:
		return idle
	
	player.velocity = player.direccion * move_speed
	if player.set_direction():
		player.update_animation(state_name)
	return null

func physics(_delta : float ) -> State:
	return null
	
func handleInput(_event: InputEvent) -> State:
	return null
	
