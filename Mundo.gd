extends Node
@export (PackedScene) var Roca
var  Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($PosicionDeInicio.position) #pisicion de inicio del jugador
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_score(Score)
	
	
func game_over():
	$ScoreTimer.stop()
	$ScoreTimer.stop()
	$Interfaz.game_over()


func _on_InicioTimer_timeout():
	$RocaTimer.start()
	$ScoreTimer.start()



func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)



func _on_RocaTimer_timeout():
	#seleccionar un lugar aleatorio en el path o camino
	$camino/RocaPosicion.set_offset(randi())
	
	var R = Roca.instantiate()
	add_child(R)
	
	#seleccionar una direccion
	var d = $camino/RocaPosicion.rotation +  PI /2
	
	R.position = $camino/RocaPosicion.position
	
	d += randf_range(-PI /4, PI /4)
	R.rotation = d
	R.set_linear_velocity(Vector2(randf_range(R.velocidad_min, R.velocidad_max), 0).rotated(d))

