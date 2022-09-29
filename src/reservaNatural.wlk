import especies.*

object reserva {
	const property habitats = []
	
	// Agrega un habitat a la lista de habitats de la reserva.
	method agregarHabitat(unHabitat) = habitats.add(unHabitat)
	
	// Hábitat con mayor biomasa de la reserva. 
	method habitatConMayorBiomasa() = habitats.max( { h => h.biomasa() })
	
	// Cantidad total de biomasa en la reserva, teniendo en cuenta todos los hábitats.
	method cantidadTotalBiomasa() = habitats.sum({ h => h.biomasa() })
	
	// Lista con los hábitats de reserva que no están en equilibrio.
	method habitatsEnDequilibrio() = habitats.map({ h => not h.esHabitatEnEquilibrio() })
	
	// Devuelve si una especie dada está en todos los hábitats de la reserva.
	method hayEspecie(unaEspecie) = habitats.all({ h => h.hayEspecie(unaEspecie)})
}

class Habitat {
	const property seresVivos = []
	
	// Agrega un ser vivo a la lista de seres vivos del habitat.
	method agregarSerVivo(unSerVivo) = seresVivos.add(unSerVivo)
	
	// Devuelve la suma de biomasa de todos los seres vivos del habitat.
	method biomasa() = seresVivos.sum({ sv => sv.biomasa()})
	
	// Saber si el hábitat está en equilibrio. 
	// Cuando la cantidad de ejemplares grandes es menor a ⅓ de la cantidad de pequeños 
	// Y además hay alguno mediano. 
	method esHabitatEnEquilibrio() = self.hayCantidadGrandesMenorAPequenios() and self.hayMediano()
	
	// Devuelve true si los ejemplares grandes es menor a 1/3 de la cantidad de pequeños.
	method hayCantidadGrandesMenorAPequenios() = self.cantidadGrandes() < self.cantidadChicos() * 0.33
	
	// Devuelve la cantidad de ejemplares grandes en el habitat.
	method cantidadGrandes() = seresVivos.count({ sv => sv.tamanio() == grande })
	
	// Devuelve la cantidad de ejemplares chicos en el habitat.
	method cantidadChicos() = seresVivos.count({ sv => sv.tamanio() == pequenio})
	
	// Devuelve true si hay al menos un ser vivo de tamanio mediano.
	method hayMediano() = seresVivos.any( { sv => sv.tamanio() == mediano})
	
	// Devuelve si una especie dada está en los seres vivos.
	method hayEspecie(unaEspecie) = seresVivos.any({ sv => sv.especie() == unaEspecie})
	
	// Producir incendio
	method producirIncendioEnHabitat(unHabitat) {
		// self.plantasEnHabitat(.forEach({ p => p.accion() }) // Crear método con efecto en Planta.
		// self.animalesEnHabitat(.forEach({ a => a.accion() }) // Crear método con efecto en Animal.
	}
	
// Las plantas pequeñas se mueren mientras que las grandes disminuyen su tamaño en 5 unidades. 
// Los animales sufren consecuencias según su modo de locomoción: 
// Los que vuelan y son grandes, se salvan, los que nadan siempre se salvan. 
// Los que corren solo se salvan si son medianos. Los que están quietos, nunca se salvan. 
// Además, todos los animales pierden peso (en un 10%). 
// Retirar del hábitat a todos los animales y plantas que hayan muerto por el incendio.

	// Producir métodos que me devuelvan listas de plantas y animales para realizarles la acción.
	// Usar .filter({})
	
	// Lista con las plantas presentes en el habitat.
	method plantasEnHabitat() {}	// filter.

	// Lista con animales presentes en el habitat.
	method animalesEnHabitat() {} 	// filter.
	
	// object volar.
	// object nadar.
}