extends CharacterBody2D
var estaIdle = true
var SPEED = 150.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("IzquierdaMarciano", "DerechaMarciano", "ArribaMarciano", "AbajoMarciano")
	velocity = direction * SPEED
	
	if  Input.is_action_pressed("DerechaMarciano"):
		$AnimatedSprite2D.play("CaminataCostadoMarciano")
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_just_released("DerechaMarciano"):
			$AnimatedSprite2D.play("IdleCostadoMarciano")

	if  Input.is_action_pressed("IzquierdaMarciano"):
		$AnimatedSprite2D.play("CaminataCostadoMarciano")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_just_released("IzquierdaMarciano"):
			$AnimatedSprite2D.play("IdleCostadoMarciano")
	
	if  Input.is_action_pressed("ArribaMarciano"):
		$AnimatedSprite2D.play("CaminataCostadoMarciano")
	elif Input.is_action_just_released("ArribaMarciano"):
			$AnimatedSprite2D.play("IdleCostadoMarciano")
	
	if  Input.is_action_pressed("AbajoMarciano"):
		$AnimatedSprite2D.play("CaminataCostadoMarciano")
	elif Input.is_action_just_released("AbajoMarciano"):
			$AnimatedSprite2D.play("IdleCostadoMarciano")
	
	move_and_slide()
	
	if Input.is_action_just_pressed("Cambiar"):
		AlternarIdle()
	if estaIdle == true:
		SPEED = 0
		get_node("PCMarcianito").set_priority(0)
	else:
		SPEED = 150
		get_node("PCMarcianito").set_priority(1)
func AlternarIdle():
	if estaIdle == true:
		estaIdle = false
	else:
		estaIdle = true
