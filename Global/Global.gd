extends Node

var NombreRueda = null
var numHoras = null
var numUser = 0
#__________________________________
var nombreUser = null
var rutaBoton = null

var entradaL = null
var entradaM = null
var entradaX = null
var entradaJ = null
var entradaV = null
#__________________________________
var salidaL = null
var salidaM = null
var salidaX = null
var salidaJ = null
var salidaV = null
#__________________________________
var usuario ={
	entradaL = null,
	entradaM = null,
	entradaX = null,
	entradaJ = null,
	entradaV = null,
	
	salidaL = null,
	salidaM = null,
	salidaX = null,
	salidaJ = null,
	salidaV = null
	}
#__________________________________

var Usuarios = {}
var UserNombre = {}
var LunesEntrada = {}
var LunesSalida = {}
var MartesEntrada = {}
var MartesSalida = {}
var MiercolesEntrada = {}
var MiercolesSalida = {}
var JuevesEntrada = {}
var JuevesSalida = {}
var ViernesEntrada = {}
var ViernesSalida = {}
var nombreBotonUser = {}
#__________________________________Añade usuarios al diccionario Usuarios
func nombreBotonUser():
	nombreBotonUser[rutaBoton] = nombreUser
	print(nombreBotonUser)
	pass 
#__________________________________Añade usuarios al diccionario Usuarios
func CrearUser():
	Usuarios[nombreUser] = numUser
	UserNombre[numUser] = nombreUser
#	print ("func Global.CrearUser" + str(Usuarios))
	pass
#__________________________________Pone la hora de entrada del lunes al usuario
func llenaLunesEntrada(nombreUser, entradaL):
	LunesEntrada[nombreUser] = entradaL
#	print ("DiccLunesEntrada: " + str(LunesEntrada))
	pass
#__________________________________Pone la hora de salida del lunes al usuario
func llenaLunesSalida(nombreUser , salidaL):
	LunesSalida[nombreUser] = salidaL
#	print ("DiccLunesSalida: " + str(LunesSalida))
	pass
#__________________________________Pone la hora de entrada del Martes al usuario
func llenaMartesEntrada(nombreUser , entradaM):
	MartesEntrada[nombreUser] = entradaM
#	print ("DiccMartesEntrada: " + str(MartesEntrada))
	pass
#__________________________________Pone la hora de salida del Martes al usuario
func llenaMartesSalida(nombreUser , salidaM):
	MartesSalida[nombreUser] = salidaM
#	print ("DiccMartesSalida: " + str(MartesSalida))
	pass
#__________________________________Pone la hora de entrada del Miercoles al usuario
func llenaMiercolesEntrada(nombreUser , entradaX):
	MiercolesEntrada[nombreUser] = entradaX
#	print ("DiccMiercolesEntrada: " + str(MiercolesEntrada))
	pass
#__________________________________Pone la hora de salida del Miercoles al usuario
func llenaMiercolesSalida(nombreUser , salidaX):
	MiercolesSalida[nombreUser] = salidaX
#	print ("DiccMiercolesSalida: " + str(MiercolesSalida))
	pass
#__________________________________Pone la hora de entrada del Jueves al usuario
func llenaJuevesEntrada(nombreUser , entradaJ):
	JuevesEntrada[nombreUser] = entradaJ
#	print ("DiccJuevesEntrada: " + str(JuevesEntrada))
	pass
#__________________________________Pone la hora de salida del Jueves al usuario
func llenaJuevesSalida(nombreUser , salidaJ):
	JuevesSalida[nombreUser] = salidaJ
#	print ("DiccJuevesSalida: " + str(JuevesSalida))
	pass
#__________________________________Pone la hora de entrada del Viernes al usuario
func llenaViernesEntrada(nombreUser , entradaV):
	ViernesEntrada[nombreUser] = entradaV
#	print ("DiccViernesEntrada: " + str(ViernesEntrada))
	pass
#__________________________________Pone la hora de salida del Viernes al usuario
func llenaViernesSalida(nombreUser , salidaV):
	ViernesSalida[nombreUser] = salidaV
#	print ("DiccViernesSalida: " + str(ViernesSalida))
	pass

	
