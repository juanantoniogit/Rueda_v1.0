extends Control

onready var horas = Global.numHoras
onready var nombre = Global.nombreUser
#var horaSalida = load("res://Configuracion/configuracion de usuario/Hora de salida/Hora de salida.tscn").instance()
#var horaEntrada = load("res://Configuracion/configuracion de usuario/Hora de entrada/Hora de entrada.tscn").instance()
var lunes = "lunes"
var martes = "martes"
var miercoles = "miercoles"
var jueves = "jueves"
var viernes = "viernes"
var semana = [lunes, martes, miercoles, jueves, viernes]
func _ready():
	horasEntrada(lunes)
	horasSalida(lunes)
	horasEntrada(martes)
	horasSalida(martes)
	horasEntrada(miercoles)
	horasSalida(miercoles)
	horasEntrada(jueves)
	horasSalida(jueves)
	horasEntrada(viernes)
	horasSalida(viernes)
	
	Nombre()
	pass	


#__________________________________Establece el nº de botones segun nº horas entrada
func horasEntrada(dia):
	for i in range (horas):
		var BotonEntrada = Button.new()
		BotonEntrada.set_text(str(i+1))
		BotonEntrada.set_name(str(i+1))
		var ruta = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/entrada"
		get_node(ruta).add_child(BotonEntrada)
		BotonEntrada.connect("pressed", self, "horaEntradaSelect",[i+1, dia])
	pass
	#_________guarda las horas y dias seleccionados en cada usuario
func horaEntradaSelect(i, dia):
	print ("horaEntrada" + str(i) + str(dia))
	pass
#__________________________________Establece el nº de botones segun nº horas salida
func horasSalida(dia):
	for i in range (horas):
		var BotonSalida = Button.new()
		BotonSalida.set_text(str(i+1))
		BotonSalida.set_name(str(i+1))
		var ruta = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/salida"
		get_node(ruta).add_child(BotonSalida)
		var funcionName = "horaSalidaSelec" + str(i+1)
		BotonSalida.connect("pressed", self, "horaSalidaSelect",[i+1,dia])
	pass
	#_________guarda las horas y dias seleccionados en cada usuario
func horaSalidaSelect(i, dia):
	print ("horaSalida" + str(i) + str(dia))
	
	pass
#__________________________________Pone el nombre del usuario a editar	
func Nombre():
	$PanelContainer/HBoxContainer/Nombre.set_text(nombre)
	pass


func Usuario():
	print ("usuario")
func _on_Guardar_pressed():
	$".".hide()
	pass 
