class_name State extends Node

static var player: Player

#Cuando entra en el estado
func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func process(_delta : float) -> State:
	return null

func physics(_delta : float ) -> State:
	return null
	
func handleInput(_event: InputEvent) -> State:
	return null
	
