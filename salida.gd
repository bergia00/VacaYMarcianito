extends Area2D
signal Victoria
var CantidAdentro = 0

func _process(delta: float) -> void:
	if CantidAdentro == 2:
		emit_signal("Victoria")
func _on_body_entered(body: Node2D) -> void:
	CantidAdentro += 1
	
func _on_body_exited(body: Node2D) -> void:
	CantidAdentro -= 1
