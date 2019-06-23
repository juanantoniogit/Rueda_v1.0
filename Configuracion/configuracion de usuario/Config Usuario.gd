extends Control

onready var horas = Global.numHoras
onready var nombre = Global.nombreUser
#var horaSalida = load("res://Configuracion/configuracion de usuario/Hora de salida/Hora de salida.tscn").instance()
#var horaEntrada = load("res://Configuracion/configuracion de usuario/Hora de entrada/Hora de entrada.tscn").instance()

func _ready():
	horasEntrada()
	horasSalida()
	Nombre()
	pass	
#__________________________________Establece el nº de botones segun nº horas entrada
func horasEntrada():
	for i in range (horas):
		var BotonEntrada = Button.new()
		BotonEntrada.set_text(str(i+1))
		BotonEntrada.set_name(str(i+1))
		$PanelContainer/HBoxContainer/entrada.add_child(BotonEntrada)
		print(i)
	pass
	#__________________________________Establece el nº de botones segun nº horas salida
func horasSalida():
	for i in range (horas):
		var BotonSalida = Button.new()
		BotonSalida.set_text(str(i+1))
		BotonSalida.set_name(str(i+1))
		$PanelContainer/HBoxContainer/salida.add_child(BotonSalida)
	pass
#__________________________________Pone el nombre del usuario a editar	
func Nombre():
	$PanelContainer/HBoxContainer/Nombre.set_text(nombre)
	pass

#func _process(delta):
#	$"/root/Configuracion".connect("conectBotonConfigUser", self, "Usuario")
	
func Usuario():
	print ("usuario")
