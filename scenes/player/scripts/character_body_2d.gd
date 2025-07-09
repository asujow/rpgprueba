class_name Player extends CharacterBody2D

var move_speed : float = 100.0

#Cuando entra en la escena llama a esto
func _ready() -> void:
	pass
	
func _process(delta):
	
	var direccion : Vector2 = Vector2.ZERO
	direccion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direccion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direccion * move_speed
	
	pass
	
func _physics_process(delta):
	move_and_slide()
