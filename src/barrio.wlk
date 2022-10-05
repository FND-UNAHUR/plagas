import elementos.*
class Barrio {
	const elementos =[]
	
	method agregarElementos(unElemento) {
		return elementos.add(unElemento)
	}
	
	method esCopado() = self.cantBuenos() > self.cantMalos()
	method cantBuenos() = elementos.count({g => g.esBueno()})
	method cantMalos() = elementos.size() - self.cantBuenos()
}
