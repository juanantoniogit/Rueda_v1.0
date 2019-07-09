extends Button

onready var padreAnularDia = get_parent().name	
#___________________________Anula las horas del dia seleccionado
func _on_anulaDia_pressed():
	var user = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Boton de usuario/").get_child(0).name
	Global.nombreUser = user
	desactivaBotones()
	if padreAnularDia == "lunes":
		Global.entradaL = null
		Global.salidaL = null
		Global.llenaLunesEntrada(user , Global.entradaL)
		Global.llenaLunesSalida(user , Global.salidaL)
		print ("lunes anulado")
	if padreAnularDia == "martes":
		Global.entradaM = null
		Global.salidaM = null
		Global.llenaMartesEntrada(user , Global.entradaM)
		Global.llenaMartesSalida(user , Global.salidaM)
		print ("martes anulado")
	if padreAnularDia == "miercoles":
		Global.entradaX = null
		Global.salidaX = null
		Global.llenaMiercolesEntrada(user , Global.entradaX)
		Global.llenaMiercolesSalida(user , Global.salidaX)
		print ("miercoles anulado")
	if padreAnularDia == "jueves":
		Global.entradaJ = null
		Global.salidaJ = null
		Global.llenaJuevesEntrada(user , Global.entradaJ)
		Global.llenaJuevesSalida(user , Global.salidaJ)
		print ("jueves anulado")
	if padreAnularDia == "viernes":
		Global.entradaV = null
		Global.salidaV = null
		Global.llenaViernesEntrada(user , Global.entradaV)
		Global.llenaViernesSalida(user , Global.salidaV)
		print ("viernes anulado")
	pass
#_______________________Desactiva los botones pulsados
var horas = Global.numHoras
func desactivaBotones():
	for i in range(horas):
		get_parent().get_node("entrada/" +str(i+1)).set_pressed(false)
		get_parent().get_node("salida/" +str(i+1)).set_pressed(false)
	pass	

	
