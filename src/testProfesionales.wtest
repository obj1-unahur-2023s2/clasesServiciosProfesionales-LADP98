import profesionales.*
import universidad.*
import empresas.*


describe "Test de Empresa"{
	// declaración de objetos 
	const sanMartin = new Universidad(provincia="Buenos Aires", honorariosRecomendados=3500)
	const unahur = new Universidad(provincia="Buenos Aires", honorariosRecomendados=4500)
	
	const juana = new ProfesionalVinculado(universidad=sanMartin)
	const gerardo = new ProfesionalAsociado(universidad=unahur)
	

	const empr1 = new Empresa(honorariosDeReferencia=3000,profesionales=#{juana,gerardo}) 
	
	method initialize() {
		
	}	
	
	test "en unahur estudio solo 1 profesional" {
		assert.equals(1,empr1.cuantosEstudiaronEn(unahur))
	}
	
}