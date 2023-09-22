import solicitantes.*
import profesionales.*
import universidad.*


class Empresa {
	const profesionales = #{}
	var property honorariosDeReferencia = 0
	const clientes = #{}
	
	method cuantosEstudiaronEn(unaUniversidad) = profesionales.count({p=>p.universidad()==unaUniversidad})

	method profesionalesCaros() {
		return profesionales.filter({p=>p.honorariosPorHora() > honorariosDeReferencia})
	}

	method universidadesFormadoras() {
		return profesionales.map({p=>p.universidad()}).asSet()
	} 
	
	method profesionalMasBarato() = profesionales.min({p=>p.honorariosPorHora()})

	method esDeGenteAcotada() {
		return not profesionales.any({p=>p.provinciasDondePuedeTrabajar().size() > 3})
	}

	method esDeGenteAcotadaAll() {
		return profesionales.all({p=>p.provinciasDondePuedeTrabajar().size() <= 3})
	}
	
	method puedeSatisfacer(unSolicitante) {
		return profesionales.any({p=>unSolicitante.puedeSerAtendidoPor(p)})
	}

	method darServicio(unSolicitante) {
		if (! self.puedeSatisfacer(unSolicitante)) {
			self.error("No puede ser atendido ")
		}
		const profesionalQueAtiende = profesionales.filter({p=>
			unSolicitante.puedeSerAtendidoPor(p)})
			.anyOne()
		// console.println(profesionalQueAtiende) para ver en consola que profesional es
		profesionalQueAtiende.cobrar(profesionalQueAtiende.honorariosPorHora())
		clientes.add(unSolicitante)		
	}
	
	method cantidadDeClientes() = clientes.size()
	
	method tieneComoClienteA(unSolicitante) = clientes.contains(unSolicitante)
	
	method profesionalCobraMenosQue(unValor) = profesionales.any({p=>p.honorariosPorHora() < unValor})
	
	method esProfesionalPocoAtractivo(unProfesional) {
		return profesionales.any({p =>
			unProfesional.provinciasDondePuedeTrabajar() == p.provinciasDondePuedeTrabajar() &&
			unProfesional.honorariosPorHora() > p.honorariosPorHora()
		})
	} 	
}