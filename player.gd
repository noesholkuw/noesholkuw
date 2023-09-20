extends Area2D

@export (int) var Velocidad
var Movimiento = Vector2()
var limite
signal golpe

func _ready():
	hide() #ocultar el personaje
	limite = get_viewport_rect().size



func _process(delta):
	Movimiento = Vector2 () #Reiniciar el valor
	
	
	if Input.is_action_pressed("ui_right"): #Derecha
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"): #Izquierda
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"): #Abajo
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"): #Arriba
		Movimiento.y -= 1
	
	if Movimiento.length() > 0: #vVerificar si se esta moviendo
		Movimiento = Movimiento.normalized() * Velocidad #Normalizar la Velocidad
		
		
		position += Movimiento * delta #Actualizar los movimientos
		position.x = clamp(position.x, 0, limite.x)
		position.y = clamp(position.y, 0, limite.y)
		
		
	if Movimiento.x != 0:
		$Sprite_player.animation = "lado"
		$Sprite_player.flip_h = Movimiento.x < 0
		$Sprite_player.flip_v = false
	elif Movimiento.y != 0:
		$Sprite_player.animation = "espalda"
		$Sprite_player.flip_v = Movimiento.y > 0
	else:
		$Sprite_player.animation = "frente"
		


func _on_Player_body_entered(body): #cuando haya una colicion con un cuerpo
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true
	
	
func inicio(pos):
	position = pos
	show() #Mostar el personaje
	$CollisionShape2D.disabled = false;
