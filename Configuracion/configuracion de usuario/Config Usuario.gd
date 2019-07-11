extends Control

onready var horas = Global.numHoras
onready var nombre = Global.nombreUser
onready var cuadrante = get_node("/root/Configuracion/Config/Cuadrante")
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
			Global.nombreUser = get_parent().get_node("Boton de usuario").get_child(0).name
			if dia == lunes:
				Global.entradaL = get_node(botonPulsado).name
			if dia == martes:
				Global.entradaM = get_node(botonPulsado).name
			if dia == miercoles:
				Global.entradaX = get_node(botonPulsado).name
			if dia == jueves:
				Global.entradaJ = get_node(botonPulsado).name
			if dia == viernes:
				Global.entradaV = get_node(botonPulsado).name
		
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
var horasSelecSalida = {lunes = null, martes = null, miercoles = null, jueves = null, viernes = null}
func horaSalidaSelect(i, dia):
#	print ("horaSalida: " + str(i) + ", " + str(dia))
	var botonPulsado = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/salida/" +str(i)
	if get_node(botonPulsado).is_pressed():
		for i in range (horas):
			var horasDia = "PanelContainer/HBoxContainer/semana/" + str(dia) + "/" + str(dia) + "/salida/" + str(i+1)
			get_node(horasDia).set_pressed(false)
			get_node(botonPulsado).set_pressed(true)
			Global.nombreUser = get_parent().get_node("Boton de usuario").get_child(0).name
			if dia == lunes:
				Global.salidaL = get_node(botonPulsado).name
			if dia == martes:
				Global.salidaM = get_node(botonPulsado).name
			if dia == miercoles:
				Global.salidaX = get_node(botonPulsado).name
			if dia == jueves:
				Global.salidaJ = get_node(botonPulsado).name
			if dia == viernes:
				Global.salidaV = get_node(botonPulsado).name
			
	pass
	#_________guarda las horas y dias seleccionados en cada usuario
func _on_Guardar_pressed():
	$".".hide()
	Global.llenaLunesEntrada(Global.nombreUser , Global.entradaL)
	Global.llenaLunesSalida(Global.nombreUser , Global.salidaL)
	Global.llenaMartesEntrada(Global.nombreUser , Global.entradaM)
	Global.llenaMartesSalida(Global.nombreUser , Global.salidaM)
	Global.llenaMiercolesEntrada(Global.nombreUser , Global.entradaX)
	Global.llenaMiercolesSalida(Global.nombreUser , Global.salidaX)
	Global.llenaJuevesEntrada(Global.nombreUser , Global.entradaJ)
	Global.llenaJuevesSalida(Global.nombreUser , Global.salidaJ)
	Global.llenaViernesEntrada(Global.nombreUser , Global.entradaV)
	Global.llenaViernesSalida(Global.nombreUser , Global.salidaV)
	#________Toma el nombre del usuario a guardar
	var nombre = get_parent().get_node("Boton de usuario").get_child(0).name
#	print ("nombre boton pulsado: " + str(nombre))
	cuadrante.llenaTablaConUser(nombre)
	pass 
