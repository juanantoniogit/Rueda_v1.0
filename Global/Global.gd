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
	print (Usuarios)
	pass
#__________________________________Pone la hora de entrada del lunes al usuario
func llenaLunesEntrada():
	LunesEntrada[nombreUser] = entradaL
#	print (LunesEntrada)
	pass
#__________________________________Pone la hora de salida del lunes al usuario
func llenaLunesSalida():
	LunesSalida[nombreUser] = salidaL
#	print (LunesSalida)
	pass
#__________________________________Pone la hora de entrada del Martes al usuario
func llenaMartesEntrada():
	MartesEntrada[nombreUser] = entradaM
#	print (MartesEntrada)
	pass
#__________________________________Pone la hora de salida del Martes al usuario
func llenaMartesSalida():
	MartesSalida[nombreUser] = salidaM
#	print (MartesSalida)
	pass

	