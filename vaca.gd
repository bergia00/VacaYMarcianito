extends CharacterBody2D
var estaIdle = false
var SPEED = 67.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	velocity = direction * SPEED

	if  Input.is_action_pressed("Derecha"):
		$AnimatedSprite2D.play("CaminataCostado")
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_just_released("Derecha"):
			$AnimatedSprite2D.play("IdleCostado")

	if  Input.is_action_pressed("Izquierda"):
		$AnimatedSprite2D.play("CaminataCostado")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_just_released("Izquierda"):
			$AnimatedSprite2D.play("IdleCostado")
	
	if  Input.is_action_pressed("Arriba"):
		$AnimatedSprite2D.play("CaminataCostado")
	elif Input.is_action_just_released("Arriba"):
			$AnimatedSprite2D.play("IdleCostado")
	
	if  Input.is_action_pressed("Abajo"):
		$AnimatedSprite2D.play("CaminataCostado")
	elif Input.is_action_just_released("Abajo"):
			$AnimatedSprite2D.play("IdleCostado")
	
	move_and_slide()
	
	if Input.is_action_just_pressed("Cambiar"):
		AlternarIdle()
	if estaIdle == true:
		SPEED = 0
		get_node("PCVaca").set_priority(0)
	else:
		SPEED = 67
		get_node("PCVaca").set_priority(1)
func AlternarIdle():
	if estaIdle == true:
		estaIdle = false
	else:
		estaIdle = true
	
