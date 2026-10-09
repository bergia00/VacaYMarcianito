extends CharacterBody2D
var estaIdle = false
var SPEED = 67.0

func _physics_process(delta: float) -> void:
	if estaIdle == false:
		Animar()
		Mover()
	if Input.is_action_just_pressed("Cambiar"):
		AlternarIdle()
	if estaIdle == true:
		get_node("PCVaca").set_priority(0)
	else:
		get_node("PCVaca").set_priority(1)
func AlternarIdle():
	if estaIdle == true:
		estaIdle = false
	else:
		estaIdle = true
func Mover():
	var direction := Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	velocity = direction * SPEED
	move_and_slide()
func Animar():
	if  Input.is_action_pressed("Derecha"):
		$AnimatedSprite2D.play("CaminataCostado")
		$AnimatedSprite2D.flip_h = true
		$CollisionShape2D.rotation_degrees = 90
	elif Input.is_action_just_released("Derecha"):
			$AnimatedSprite2D.play("IdleCostado")

	if  Input.is_action_pressed("Izquierda"):
		$AnimatedSprite2D.play("CaminataCostado")
		$AnimatedSprite2D.flip_h = false
		$CollisionShape2D.rotation_degrees = 90
	elif Input.is_action_just_released("Izquierda"):
			$AnimatedSprite2D.play("IdleCostado")
	
	if  Input.is_action_pressed("Arriba"):
		$AnimatedSprite2D.play("CaminataArriba")
		$AnimatedSprite2D.flip_h = false
		$CollisionShape2D.rotation_degrees = 0
	elif Input.is_action_just_released("Arriba"):
			$AnimatedSprite2D.play("IdleArriba")
	
	if  Input.is_action_pressed("Abajo"):
		$AnimatedSprite2D.play("CaminataAbajo")
		$AnimatedSprite2D.flip_h = false
		$CollisionShape2D.rotation_degrees = 0
	elif Input.is_action_just_released("Abajo"):
			$AnimatedSprite2D.play("IdleAbajo")
