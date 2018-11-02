class Expedicion{
 	var lstVikingos = []
 	
 	method cantidadVikingos() = return lstVikingos.size()
 	method agregarVikingo(vikingo) = lstVikingos.add(vikingo)
 }
 
 class Vikingo{
 	var property castaSocial 
 	var cantArmas
 	var cantKills
 	
 	
 	method escalarSocialmente()
 	method esProductivo()
 	
 	method puedeIrAExpedicion() {
 		if (castaSocial == jarl){
 			return cantArmas == 0 and self.esProductivo()
 		}
 		else return self.esProductivo()
 		
 	} 
 	
 	method expedicionValeLaPena(aldea,capital,expedicion){
 		return aldea.valeLaPena(expedicion) and capital.valeLaPena(expedicion) 
 	}

 }
 
 class Soldado inherits Vikingo{
 	
 	override method esProductivo() = return cantKills > 20 and cantArmas>=1
 	override method escalarSocialmente(){
 		if (castaSocial == jarl){
 			self.castaSocial(karl)
 			cantArmas+=10
 		} else self.castaSocial(thrall)

 	}
 }
 
 class Granjero inherits Vikingo{
 	var cantHijos
 	var hectareas
 	
 	override method esProductivo() = return hectareas == 2*cantHijos
	override method escalarSocialmente(){
 		if (castaSocial == jarl){
 			self.castaSocial(karl)
 			cantHijos +=2
 			hectareas +=2
 		} else self.castaSocial(thrall)

 	} 
 }
 
 object jarl{
 	
 }
 
 object karl{

 }
 
 object thrall{
 	
 }
 
 class Capital {
 	var factorRiqueza
 	//Se sabe que cuando se invada la capital, 
 	//cada vikingo se cobrará la vida de un defensor.
 	//BOTIN CONSEGUIDO => expedicion.cantidadVikingos() * factorRiqueza
 	method valeLaPena(expedicion) = return expedicion.cantidadVikingos() *factorRiqueza>= 3* expedicion.cantidadVikingos()
 	
 }
 class Iglesia{
 	var property cantCrucifijos
 }
 
 class Aldea {
 	var lstIglesias= []
 	const sedSaqueo = 15
 	
 	method valeLaPena(expedicion) = return lstIglesias.sum({iglesia => iglesia.cantCrucifijos()}) > sedSaqueo
 	method agregarIglesia(iglesia) = lstIglesias.add(iglesia)
 }
 
 class AldeaAmurallada inherits Aldea{
 	var cantNecesaria
 	
 	override method valeLaPena(expedicion)= return super(expedicion) and expedicion.cantidadVikingos() > cantNecesaria
 }
 