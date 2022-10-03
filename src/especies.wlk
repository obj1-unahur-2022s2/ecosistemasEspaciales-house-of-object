class EspecieFauna {
	const property pesoReferencia
	const property formaLocomocion
	const animales = []
	
	method agregarAnimal(unAnimal) = animales.add(unAnimal)
	
	method biomasa() = animales.sum({a => a.biomasa()})
}

class EspecieFlora {
	const property alturaReferencia = 10
	const plantas = []
	
	method agregarPlanta(unaPlanta) = plantas.add(unaPlanta)
	
	method biomasa() = plantas.sum({a => a.biomasa()})
}

class Animal {
	const property especie
	var property peso
	var property biomasa = (peso ** 2) / especie.pesoReferencia()
	var property estaVivo= true 
	
	method tamanio() {return 
		if (self.esPequenio()) pequenio
		else if (self.esGrande()) grande
		else mediano				
	}
	
	method esGrande() = peso > especie.pesoReferencia() * 2
	
	method esPequenio()= peso < especie.pesoReferencia() / 2
	
	method consecuenciaIncendio(){
		if(self.especie().formaLocomocion().seSalva(self)) peso *= 0.90
		else estaVivo=false
	}
}

class Planta {
	const property especie
	var property altura
	var property biomasa = especie.alturaReferencia().min(altura * 2)
	var property estaVivo= true 
	
	method tamanio() {return
		if (self.esPequenio()) pequenio
		else grande			
	}	
	
	method esGrande() = altura >=10
	
	method esPequenio()=not self.esGrande()
	
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
	method seSalva(animal) = animal.tamanio() == mediano
}

object quieto{
	method seSalva(animal) = false
}