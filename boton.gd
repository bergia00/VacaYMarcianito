extends Area2D
signal Presionado
var Pisado = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Marcianito" && Pisado == false:
		emit_signal("Presionado") #
		#$AudioStreamPlayer2D.play() descomentar y poner sonido de boton(?
		print("me an pisao")
		Pisado = true
