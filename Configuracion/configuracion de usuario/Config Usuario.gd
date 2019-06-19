extends Control

onready var horas = Global.numHoras
onready var nombre = Global.nombreUser
var horaSalida = load("res://Configuracion/configuracion de usuario/Hora de salida/Hora de salida.tscn").instance()
var horaEntrada = load("res://Configuracion/configuracion de usuario/Hora de entrada/Hora de entrada.tscn").instance()

func _ready():
	horasEntrada()
	horasSalida()
	pass	
func horasEntrada():
	for i in range (horas):
#		horaEntrada.set_name(i)
		$PanelContainer/HBoxContainer/entrada.add_child(horaEntrada)
#		var botonHora = get_node("/root/Configuracion/Usuarios/VBoxContainer/Config Usuario/PanelContainer/HBoxContainer/entrada/Hora de entrada/Button")
#		botonHora.set_text(i)
	pass
func horasSalida():
	for i in range (6):
		$PanelContainer/HBoxContainer/salida.add_child(horaSalida)
	pass