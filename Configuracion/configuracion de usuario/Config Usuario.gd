extends Control

onready var horas = Global.numHoras
onready var nombre = Global.nombreUser
var horaSalida = load("res://Configuracion/configuracion de usuario/Hora de salida/Hora de salida.tscn")
var horaEntrada = load("res://Configuracion/configuracion de usuario/Hora de entrada/Hora de entrada.tscn")

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

#__________________________________Pone el nombre del usuario a editar	
func Nombre():
	$PanelContainer/HBoxContainer/Nombre.set_text(nombre)
	pass
#__________________________________Establece el nº de botones segun nº horas entrada
func horasEntrada(dia):
	for i in range (horas):
#		var BotonEntrada = Button.new()
		var BotonEntrada = horaEntrada.instance()
		BotonEntrada.set_text(str(i+1))
		BotonEntrada.set_name(str(i+1))
		var ruta = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/entrada"
		get_node(ruta).add_child(BotonEntrada)
		BotonEntrada.connect("pressed", self, "horaEntradaSelect",[i+1, dia])
	pass
	#_________marca la ultima hora seleccionada de cada dia a la entrada
func horaEntradaSelect(i, dia):
	var botonPulsado = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/entrada/" +str(i)
	if get_node(botonPulsado).is_pressed():
		for i in range (horas):
			var horasDia = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/entrada/" + str(i+1)
			get_node(horasDia).set_pressed(false)
			get_node(botonPulsado).set_pressed(true)
	pass
#__________________________________Establece el nº de botones segun nº horas salida
func horasSalida(dia):
	for i in range (horas):
		var BotonSalida = horaSalida.instance()
#		var BotonSalida = Button.new()
		BotonSalida.set_text(str(i+1))
		BotonSalida.set_name(str(i+1))
		var ruta = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/salida"
		get_node(ruta).add_child(BotonSalida)
		var funcionName = "horaSalidaSelec" + str(i+1)
		BotonSalida.connect("pressed", self, "horaSalidaSelect",[i+1,dia])
	pass
	#_________marca la ultima hora seleccionada de cada dia a la salida
func horaSalidaSelect(i, dia):
	print ("horaSalida" + str(i) + str(dia))
	var botonPulsado = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/salida/" +str(i)
	if get_node(botonPulsado).is_pressed():
		for i in range (horas):
			var horasDia = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/salida/" + str(i+1)
			get_node(horasDia).set_pressed(false)
			get_node(botonPulsado).set_pressed(true)
	pass
	#_________guarda las horas y dias seleccionados en cada usuario
func _on_Guardar_pressed():
	
	$".".hide()
	pass 




