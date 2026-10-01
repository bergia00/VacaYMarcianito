extends CharacterBody2D
var estaIdle = false
var SPEED = 300.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("V_Izquierda", "V_Derecha", "V_Arriba", "V_Abajo")
	velocity = direction * SPEED
	move_and_slide()
	if Input.is_action_just_pressed("Cambiar"):
		AlternarIdle()
	if estaIdle == true:
		SPEED = 0
		get_node("PCVaca").set_priority(0)
	else:
		SPEED = 300
		get_node("PCVaca").set_priority(1)
func AlternarIdle():
	if estaIdle == true:
		estaIdle = false
	else:
		estaIdle = true
	
