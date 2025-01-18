extends CharacterBody2D
@export var movspeed: float = 400
@onready var anim: AnimationPlayer =get_node("AnimationPlayer")
@export var posso_at = true

func _physics_process(delta):
	movie()
	attack()

func movie() ->void:
	var direction: Vector2 = get_direction()
	velocity = direction * movspeed
	move_and_slide()
func get_direction() -> Vector2:
	return Vector2(
		Input.get_axis("left","right"),
		Input.get_axis("up","down")
	).normalized()
func attack()->void:
	if Input.is_action_just_pressed("shoot") and posso_at:
		posso_at = false
		anim.play("shoot")
func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"shoot":
			posso_at=true

