class EspecieFauna {
	const property pesoReferencia
	const property formaLocomocion
	const animales = []
	
	// Agrega un animal a la especie de fauna.
	method agregarAnimal(unAnimal) = animales.add(unAnimal)
	
	// Devuelve la biomasa total de los animales de la especie.
	method biomasa() = animales.sum({a => a.biomasa()})
	

}

class EspecieFlora {
	const property alturaReferencia = 10
	const plantas = []
	
	// Agrega una planta a la especia de flora.
	method agregarPlanta(unaPlanta) = plantas.add(unaPlanta)
	
	
}

// Fauna.
class Animal {
	const property especie
	var property peso
	// Duda. Peso al cuadrado sobre el ¿coeficiente propio de su especie?
	var property biomasa = (peso ** 2) / especie.pesoReferencia()
	var property estaVivo= true 
	method tamanio() {return 
		if (self.esPequenio())  pequenio
		else if (self.esGrande())   grande
		else  mediano			
		
	}
	// Método necesario para el object volar.
	method esGrande() = peso > especie.pesoReferencia() * 2
	//metodo necesario para el peso.
	method esPequenio()=peso < especie.pesoReferencia() / 2
// Los animales sufren consecuencias según su modo de locomoción: 
// Los que vuelan y son grandes, se salvan, los que nadan siempre se salvan. 
// Los que corren solo se salvan si son medianos. Los que están quietos, nunca se salvan. 
// Además, todos los animales pierden peso (en un 10%). 
// Retirar del hábitat a todos los animales y plantas que hayan muerto por el incendio.
	method consecuenciaIncendio(){
		if(self.especie().formaLocomocion().seSalva(self))
			peso *= 0.90
		else 
			estaVivo=false
	}
}

// Flora.
class Planta {
	const property alturaReferencia = 10
	const property especie
	var property altura
	var property tamanio
	var property biomasa = alturaReferencia.min(altura * 2)
	var property estaVivo= true 
	
	method tamanio() {
		if (self.esPequenio()) tamanio = pequenio
		else tamanio = grande			
		return tamanio
	}
		
	method esGrande() = altura >=10
	
	method esPequenio()=not self.esGrande()
// Las plantas pequeñas se mueren mientras que las grandes disminuyen su tamaño en 5 unidades. 

	method consecuenciaIncendio(){
		if (self.esPequenio()) estaVivo=false 
		else altura-=5
	}
	
}

// Objetos para el method tamanio de las clases Animal y Planta.
object grande {
	method tamanio() = self
}

object mediano {
	method tamanio() = self
}

object pequenio {
	method tamanio() = self
}

object volar {
	method seSalva(animal) = animal.esGrande()
}

object nadar {
	method seSalva(animal) = true
}

object correr{
	method seSalva(animal)=animal.tamanio()==mediano
}

object quieto{
	method seSalva(animal) = false
}