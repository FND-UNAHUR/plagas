import plagas.*
object nivelProduccion {
	var property nivel = 0
}
class Elemento {
	method recibirAtaque(unaPlaga) {
		unaPlaga.efectoDelAtaque()
	}
}
class Hogar inherits Elemento {
	var property mugre 
	var property confort 
	
	method esBueno() = mugre < confort * 0.5
	override method recibirAtaque(unaPlaga) {
		mugre += unaPlaga.nivelDeDanio()
		super(unaPlaga)
	}
}
class Huerta inherits Elemento  {
	var property capacidadProduccion
 	method esBueno() = nivelProduccion.nivel() < capacidadProduccion
 	override method recibirAtaque(unaPlaga) {
		capacidadProduccion -= unaPlaga.nivelDeDanio() * 0.1
		if(unaPlaga.transmiteEnfermedades()) capacidadProduccion -= 10
		super(unaPlaga)
	}
}
class Mascota inherits Elemento  {
	var property nivelSalud
	
	method esBueno() = nivelSalud > 250
	override method recibirAtaque(unaPlaga) {
		if(unaPlaga.transmiteEnfermedades()) nivelSalud -=  unaPlaga.nivelDeDanio()
		super(unaPlaga)
	}

}
