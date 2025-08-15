class_name State_Attack extends State

static var state_name: String = "attack"
var attacking : bool = false
@export var move_speed : float = 100.0
@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelerate : float = 5.0
@onready var idle: State = $"../Idle"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var walk: State_Walk = $"../Walk"
@onready var attack_player: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

#Cuando entra en el estado
func enter() -> void:
	player.update_animation(state_name)
	animation_player.animation_finished.connect( endAttack )
	attack_player.play( state_name + "_" + player.anim_direction() )
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.8, 1.2)
	audio.play()
	attacking = true
	pass
	
func exit() -> void:
	attacking = false
	animation_player.animation_finished.disconnect( endAttack )
	pass
	
func process(_delta : float) -> State:
	if attacking == false:
		if player.direccion == Vector2.ZERO:
			return idle
		else:
			return walk
	player.velocity -= player.velocity * decelerate * _delta
	return null

func physics(_delta : float ) -> State:
	return null
	
func handleInput(_event: InputEvent) -> State:
	return null
	
func endAttack( _newAnimName : String ) -> void:
	attacking = false
