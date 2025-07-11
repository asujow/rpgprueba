class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direccion : Vector2 = Vector2.ZERO
var move_speed : float = 100.0
var state : String = "idle"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D


#Cuando entra en la escena llama a esto
func _ready() -> void:
	pass
	
func _process(delta):
	
	direccion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direccion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direccion * move_speed
	
	if set_state() == true or set_direction() == true:
		update_animation()
	
	pass
	
func _physics_process(delta):
	move_and_slide()


func set_direction() -> bool:
	var new_direccion : Vector2 = cardinal_direction
	if direccion == Vector2.ZERO:
		return false
	
	if direccion.y == 0:
		if direccion.x < 0:
			new_direccion = Vector2.LEFT
		else: 
			new_direccion = Vector2.RIGHT
	elif direccion.x == 0:
		if direccion.y < 0:
			new_direccion = Vector2.UP
		else:
			new_direccion = Vector2.DOWN
		
	if new_direccion == cardinal_direction:
		return false
	cardinal_direction = new_direccion
	sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true

func set_state() -> bool:
	var new_state : String
	if direccion == Vector2.ZERO:
		new_state = "idle"
	else:
		new_state = "walk"
	if new_state == state:
		return false
	state = new_state
	return true

func update_animation() -> void:
	animation_player.play(state + "_" + anim_direction())
	pass
	
func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
