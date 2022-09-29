class EspecieFauna {
	const property pesoReferencia
	const property formaLocomocion
	const animales = []
	
	// Agrega un animal a la especie de fauna.
	method agregarAnimal(unAnimal) = animales.add(unAnimal)
	
	// Devuelve la biomasa total de los animales de la especie.
	method biomasa() = animales.sum({a => a.biomasa()})
	
	// Saber si la especie está en equilibrio. 
	// method esEspecieEnEquilibrio() = self.hayCantidadGrandesMenorAPequenios() and self.hayMediano()
	
	// Devuelve true si los ejemplares grandes es menor a 1/3 de la cantidad de pequeños.
	// method hayCantidadGrandesMenorAPequenios() = self.cantidadGrandes() > self.cantidadChicos() * 0.3
	
	// Devuelve la cantidad de ejemplares grandes en la especie.
	// method cantidadGrandes() = animales.count({ sv => sv.tamanio() == grande })
	
	// Devuelve la cantidad de ejemplares chicos en la especie.
	// method cantidadChicos() = animales.count({ sv => sv.tamanio() == pequenio})
	
	// Devuelve true si hay al menos un ser vivo de tamanio mediano.
	// method hayMediano() = animales.any( { sv => sv.tamanio() == mediano})
}

class EspecieFlora {
	const property alturaReferencia = 10
	const plantas = []
	
	// Agrega una planta a la especia de flora.
	method agregarPlanta(unaPlanta) = plantas.add(unaPlanta)
	
	// Devuelve la biomasa total de las plantas de la especie.
	// method biomasa() = plantas.sum({a => a.biomasa()})
	
	// Devuelve true si los ejemplares grandes es menor a 1/3 de la cantidad de pequeños.
	// method hayCantidadGrandesMenorAPequenios() = self.cantidadGrandes() > self.cantidadChicos() * 0.3
	
	// Devuelve la cantidad de ejemplares grandes en la especie.
	// method cantidadGrandes() = plantas.count({ sv => sv.tamanio() == grande })
	
	// Devuelve la cantidad de ejemplares chicos en la especie.
	// method cantidadChicos() = plantas.count({ sv => sv.tamanio() == pequenio})
}

// Fauna.
class Animal {
	const property pesoReferencia
	const property especie
	var property peso
	// Duda. Peso al cuadrado sobre el ¿coeficiente propio de su especie?
	var property biomasa = (peso ** 2) / pesoReferencia
	var property tamanio
	method tamanio() {
		if (peso < pesoReferencia / 2) tamanio = pequenio
		else if (peso > pesoReferencia * 2) tamanio = grande
		else tamanio = mediano			
		return tamanio
	}
	// Método necesario para el object volar.
	method esGrande() = peso > pesoReferencia * 2
}

// Flora.
class Planta {
	const property alturaReferencia = 10
	const property especie
	var property altura
	var property tamanio
	var property biomasa = alturaReferencia.min(altura * 2)
	
	method tamanio() {
		if (altura < 10) tamanio = pequenio
		else tamanio = grande			
		return tamanio
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
	method seSalva(_) = true
}