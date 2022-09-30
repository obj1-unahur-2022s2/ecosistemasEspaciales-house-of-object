import especies.*

// object reserva.
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

// class Habitat.
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
	method producirIncendioEnHabitat() {
		seresVivos.forEach({sv => sv.consecuenciaIncendio()})
		seresVivos.removeAll(self.eliminarMuertos())
	}

	// Lista con los seres vivos que están muertos --> not estaVivo().	
	method eliminarMuertos()= seresVivos.map({sv => not sv.estaVivo()})
}