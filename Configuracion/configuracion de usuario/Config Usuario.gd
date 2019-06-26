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
		var funcionName = "horaEntradaSelec" + str(i+1)
		BotonEntrada.connect("pressed", self, funcionName)
	pass
	#__________________________________Establece el nº de botones segun nº horas salida
func horasSalida():
	for i in range (horas):
		var BotonSalida = Button.new()
		BotonSalida.set_text(str(i+1))
		BotonSalida.set_name(str(i+1))
		$PanelContainer/HBoxContainer/salida.add_child(BotonSalida)
		var funcionName = "horaSalidaSelec" + str(i+1)
		BotonSalida.connect("pressed", self, funcionName)
	pass

#__________________________________Pone el nombre del usuario a editar	
func Nombre():
	$PanelContainer/HBoxContainer/Nombre.set_text(nombre)
	
	pass

#func _process(delta):
#	$"/root/Configuracion".connect("conectBotonConfigUser", self, "Usuario")
	
func Usuario():
	print ("usuario")
	
#__________________________________funciones para los botones de seleccion de hora
#__________________________________de salida y de entrada
#_________________________Entrada
func horaEntradaSelec1():
	print ("1 hora Entrada")
	pass
func horaEntradaSelec2():
	print ("2 hora Entrada")
	pass
func horaEntradaSelec3():
	print ("3 hora Entrada")
	pass
func horaEntradaSelec4():
	print ("4 hora Entrada")
	pass
func horaEntradaSelec5():
	print ("5 hora Entrada")
	pass
func horaEntradaSelec6():
	print ("6 hora Entrada")
	pass
func horaEntradaSelec7():
	print ("7 hora Entrada")
	pass
func horaEntradaSelec8():
	print ("8 hora Entrada")
	pass
func horaEntradaSelec9():
	print ("9 hora Entrada")
	pass
func horaEntradaSelec10():
	print ("10 hora Entrada")
	pass
func horaEntradaSelec11():
	print ("11 hora Entrada")
	pass
func horaEntradaSelec12():
	print ("12 hora Entrada")
	pass
func horaEntradaSelec13():
	print ("13 hora Entrada")
	pass
func horaEntradaSelec14():
	print ("14 hora Entrada")
	pass
func horaEntradaSelec15():
	print ("15 hora Entrada")
	pass
func horaEntradaSelec16():
	print ("16 hora Entrada")
	pass
func horaEntradaSelec17():
	print ("17 hora Entrada")
	pass
func horaEntradaSelec18():
	print ("18 hora Entrada")
	pass
func horaEntradaSelec19():
	print ("19 hora Entrada")
	pass
func horaEntradaSelec20():
	print ("20 hora Entrada")
	pass
func horaEntradaSelec21():
	print ("21 hora Entrada")
	pass
func horaEntradaSelec22():
	print ("22 hora Entrada")
	pass
func horaEntradaSelec23():
	print ("23 hora Entrada")
	pass
func horaEntradaSelec24():
	print ("24 hora Entrada")
	pass
	#_________________________Salida
func horaSalidaSelec1():
	print ("1 hora Salida")
	pass
func horaSalidaSelec2():
	print ("2 hora Salida")
	pass
func horaSalidaSelec3():
	print ("3 hora Salida")
	pass
func horaSalidaSelec4():
	print ("4 hora Salida")
	pass
func horaSalidaSelec5():
	print ("5 hora Salida")
	pass
func horaSalidaSelec6():
	print ("6 hora Salida")
	pass
func horaSalidaSelec7():
	print ("7 hora Salida")
	pass
func horaSalidaSelec8():
	print ("8 hora Salida")
	pass
func horaSalidaSelec9():
	print ("9 hora Salida")
	pass
func horaSalidaSelec10():
	print ("10 hora Salida")
	pass
func horaSalidaSelec11():
	print ("11 hora Salida")
	pass
func horaSalidaSelec12():
	print ("12 hora Salida")
	pass
func horaSalidaSelec13():
	print ("13 hora Salida")
	pass
func horaSalidaSelec14():
	print ("14 hora Salida")
	pass
func horaSalidaSelec15():
	print ("15 hora Salida")
	pass
func horaSalidaSelec16():
	print ("16 hora Salida")
	pass
func horaSalidaSelec17():
	print ("17 hora Salida")
	pass
func horaSalidaSelec18():
	print ("18 hora Salida")
	pass
func horaSalidaSelec19():
	print ("19 hora Salida")
	pass
func horaSalidaSelec20():
	print ("20 hora Salida")
	pass
func horaSalidaSelec21():
	print ("21 hora Salida")
	pass
func horaSalidaSelec22():
	print ("22 hora Salida")
	pass
func horaSalidaSelec23():
	print ("23 hora Salida")
	pass
func horaSalidaSelec24():
	print ("24 hora Salida")
	pass

