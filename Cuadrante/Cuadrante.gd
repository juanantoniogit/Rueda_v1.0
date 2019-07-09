extends Control

onready var preEscenaHora = load("res://Cuadrante/Hora/hora.tscn")
var usuario = load("res://Cuadrante/Usuario/usuario.tscn")
var label = "usuario/nombre usuario"
var coche = "usuario/coche"
var diasSemana = ["ColHorario", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes"]

func _ready():
	numHoras()
#func _process(delta):
#	llenaTablaConUser()

	
#______________________Crea la tabla en funcion del nº de horas
func numHoras():
	var numHoras = int(Global.numHoras) 
	for i in numHoras:
		for a in len(diasSemana):
			horas(i, a)
func horas(horas , dia):
#	__________Añade nueva hora a la columna Lunes
	var escenaHora = preEscenaHora.instance()
	var horario = get_node("HBoxContainer/" + str(diasSemana[dia]))
	horario.add_child(escenaHora)
	var newHora = horario.get_child(1 + horas)
	newHora.set_name("hora0"  + str(horas + 1))
func ponUserEnHora(hora):
#	_______Añade nuevo usuario a la hora
	var newUser = hora.get_node("VBoxContainer")
	newUser.add_child(usuario.instance())
	newUser.get_node(label).set_text("Usuarios")
	newUser.get_node(coche).hide()
func llenaTablaConUser():
	print ("llena tabla")
	for i in len(Global.Usuarios):
		print (Global.LunesEntrada[Global.UserNombre[i+1]])
