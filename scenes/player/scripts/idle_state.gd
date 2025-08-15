class_name State_Idle extends State

static var state_name: String = "idle"
@onready var walk: State_Walk = $"../Walk"
@onready var attack: State_Attack = $"../Attack"

#Cuando entra en el estado
func enter() -> void:
	player.update_animation(state_name)
	pass
	
func exit() -> void:
	pass
	
func process(_delta : float) -> State:
	if player.direccion != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null

func physics(_delta : float ) -> State:
	return null
	
func handleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
	
