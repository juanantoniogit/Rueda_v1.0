extends Control
onready var botonUsuario = load("res://Configuracion/Boton de usuario/Boton de usuario.tscn").instance()
onready var preEscenaHora = load("res://Cuadrante/Hora/hora.tscn")
var usuario = load("res://Cuadrante/Usuario/usuario.tscn")
var label = "usuario/nombre usuario"
var coche = "usuario/coche"
var diasSemana = ["ColHorario", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes"]

func _ready():
	numHoras()
	botonUsuario.connect("nombreUsuarioBoton",self,"_nombreUser")
#func _process(delta):

func _nombreUser():
	print("!hola")
#______________________Crea la tabla en funcion del nº de horas
func numHoras():
	var numHoras = int(Global.numHoras) 
	for i in numHoras:
		for a in len(diasSemana):
			horas(i, a)
#	___________________Añade nueva hora a cada dia (ready)
func horas(horas , dia):
#	__________Añade nueva hora a la columna Lunes
	var escenaHora = preEscenaHora.instance()
	var horario = get_node("HBoxContainer/" + str(diasSemana[dia]))
	horario.add_child(escenaHora)
	var newHora = horario.get_child(1 + horas)
	newHora.set_name("hora0"  + str(horas + 1))
#______________________Ubica a cada usuario en la tabla 
func llenaTablaConUser(nombre):
	quitaUserEnHora(nombre)

#_________________________Quita al usuario de otras horas. Si estubiera
func quitaUserEnHora(nombre):
	var numHoras = int(Global.numHoras) 
	for i in numHoras:
		var horas = "HBoxContainer/Lunes/hora0" + str(int(i) + 1) + "/VBoxContainer/"
		var userPorHora = get_node(horas).get_child_count()
#		print ("numero usuarios en la hora " + str(int(i) + 1) + ": " + str(userPorHora))
		if userPorHora >= 1:
			for i in userPorHora:
				var userNamePorHora = get_node(horas).get_child(i).name
				var labelUserPorHora = get_node(str(horas) + str(userNamePorHora) + "/nombre usuario" )
#				print("hora: " + str(i))
#				print ("nombre usuario" + str(i) + ": " + str(userNamePorHora))
				if userNamePorHora == nombre:
					print("userNamePorHora == nombre")
					var rutaUsusarioExistente = str(horas) + str(nombre)
#					print ("ruta usuario existente: " + str(rutaUsusarioExistente))
					get_node(rutaUsusarioExistente).queue_free()
					
				if labelUserPorHora.get_text() == nombre:
					labelUserPorHora.get_parent().queue_free()
					print("Etiqueta == nombre")
					
				var regex = RegEx.new()
				regex.compile("^[a]+$")
				var result = regex.search(userNamePorHora)
				print( "result: " + str(result))
				print( "nombre usuario por hora: " + str(userNamePorHora))
				if result == null:
					print("resultado nulo ??")
				else:
					print("resultado: " + str(result))
					pass
			
			
	ponUserEnHora(nombre)

#___________________________Coloca al usuario en la hora.
func ponUserEnHora(nombre):
	var numHora = Global.LunesEntrada[nombre]
	var horaSelec = "HBoxContainer/Lunes/hora0" + str(numHora) + "/VBoxContainer/"
	get_node(horaSelec).add_child(usuario.instance())
	var newUser = str(horaSelec) + str(label)
	get_node(newUser).set_text(str(nombre))
	var nodoNombreUsuario = "HBoxContainer/Lunes/hora0" + str(numHora) + "/VBoxContainer/usuario"
	get_node(nodoNombreUsuario).set_name(str(nombre))

			
			
			
#		print("user x hora: " + str(UserPorHora))
#			.len(get_children())
#			if nombreUser == Global.UserNombre[int(i)+1]:
#		print ("nombre existe")
#			var nodoUsuario = str(horas) + "usuario/"
#			var nombreUsuarioLabel = get_node(horas).get_child(0).name
#			print(str(nodoUsuario) + str(nombreUsuarioLabel))
			
#		newUser.get_node(label).set_text("Usuarios")
#		newUser.get_node(coche).hide()
		
	#	________________________Esta funcion no se usa por ahora	

#	_______Añade nuevo usuario a la hora
#	var newUser = hora.get_node("VBoxContainer")
#	newUser.add_child(usuario.instance())
#	newUser.get_node(label).set_text("Usuarios")
#	newUser.get_node(coche).hide()
	