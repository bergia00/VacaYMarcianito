extends Area2D

var Pisado = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Marcianito" && Pisado == false:
		$Puerta.queue_free()
		Pisado = true
		$AnimatedSprite2D.play("Apretado")
