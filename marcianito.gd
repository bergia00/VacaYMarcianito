extends CharacterBody2D
var estaIdle = true
var SPEED = 150.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Cambiar"):
		AlternarIdle()
	if estaIdle == false:
		Animar()
		Mover()
	if estaIdle == true:
		get_node("PCMarcianito").set_priority(0)
	else:
		get_node("PCMarcianito").set_priority(1)
	if estaIdle == true:
		get_node("PCMarcianito").set_priority(0)
	else:
		get_node("PCMarcianito").set_priority(1)
func AlternarIdle():
	if estaIdle == true:
		estaIdle = false
	else:
		estaIdle = true
func Animar():
	if  Input.is_action_pressed("Derecha"):
		$AnimatedSprite2D.play("CaminataCostadoMarciano")
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_just_released("Derecha"):
			$AnimatedSprite2D.play("IdleCostadoMarciano")

	if  Input.is_action_pressed("Izquierda"):
		$AnimatedSprite2D.play("CaminataCostadoMarciano")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_just_released("Izquierda"):
			$AnimatedSprite2D.play("IdleCostadoMarciano")
	
	if  Input.is_action_pressed("Arriba"):
		$AnimatedSprite2D.play("CaminataArribaMarcianito")
	elif Input.is_action_just_released("Arriba"):
			$AnimatedSprite2D.play("IdleArribaMarcianito")
	
	if  Input.is_action_pressed("Abajo"):
		$AnimatedSprite2D.play("CaminataAbajoMarcianito")
	elif Input.is_action_just_released("Abajo"):
			$AnimatedSprite2D.play("IdleAbajoMarcianito")
func Mover():
	var direction := Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo")
	velocity = direction * SPEED
	move_and_slide()
