extends Area2D
signal Victoria
var cuantosAdentro = 0
func _process(delta: float) -> void:
	if cuantosAdentro == 2:
		emit_signal("Victoria")
func _on_body_entered(body: Node2D) -> void:
	cuantosAdentro += 1
func _on_body_exited(body: Node2D) -> void:
	cuantosAdentro -= 1
