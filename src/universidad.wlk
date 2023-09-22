class Universidad {
	var property provincia
	var property honorariosRecomendados
	var donacionesTotales = 0
	
	method recibirDonacion(unValor) {donacionesTotales += unValor} 
	
}

object asociacionProfesionalesDelLitoral {
	var donacionesTotales = 0
	method recibirDonacion(unValor) {donacionesTotales += unValor} 
}
