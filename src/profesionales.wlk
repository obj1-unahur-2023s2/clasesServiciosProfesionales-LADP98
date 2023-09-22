import universidad.*

class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(unImporte) {
		asociacionProfesionalesDelLitoral.recibirDonacion(unImporte)
	}
}

class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }

	method provinciasDondePuedeTrabajar() = #{universidad.provincia()}

	method honorariosPorHora() = universidad.honorariosRecomendados()

	method cobrar(unImporte) {
		universidad.recibirDonacion(unImporte/2)
	}
}

// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var property universidad
	const provincias = #{}
	var property honorariosPorHora
	var totalRecaudado = 0
	
	method agregarProvincia(unaProvincia) {provincias.add(unaProvincia)}
	method quitarleProvincia(unaProvincia) {provincias.remove(unaProvincia)}
	
	method provinciasDondePuedeTrabajar() = provincias
	
	method cobrar(unImporte) { totalRecaudado += unImporte }
	
	method pasarDinero(profesional,unImporte) {
		profesional.cobrar(unImporte.min(totalRecaudado))
		totalRecaudado -= unImporte.min(totalRecaudado)
	}
}