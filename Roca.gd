extends RigidBody2D

@export (int) var velocidad_min
@export (int) var velocidad_max

var tipo_roca = ["grande", "chiquito"]


func _ready():
	$AnimatedSprite2D.animation = tipo_roca [randi() % tipo_roca.size()]
	
	if $AnimatedSprite2D.animation == "grande":
		$CollisionShape2D.scale.x = 1.5
		$CollisionShape2D.scale.y = 1.5




func _on_Visibilidad_screen_exited():
	queue_free() #elimina la roca de la escena
