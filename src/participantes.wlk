import conocimientos.*
import cumbre.*

class Participante {
	const conocimientos = #{}
	const pais
	const commitsRealizados
	
	method pais() = pais
	method conocimientos() = conocimientos
	method cantidadDeCommits() = commitsRealizados
	method esCape()
	method puedeIngresar() = conocimientos.contains(programacionBasica)
	method esExtrajero() = not cumbre.paisesAuspiciantes().contains(self.pais())
	
	
}

class Programador inherits Participante {
	override method esCape() = commitsRealizados > 500
	override method puedeIngresar() = super()
	 and commitsRealizados == cumbre.reqCommits()
	 and conocimientos.contains(objetos)
}

class Especialista inherits Participante {
	override method esCape() = conocimientos.size( )> 2
	override method puedeIngresar() = super() and commitsRealizados == cumbre.reqCommits()-100
}

class Pais {
	const conflictos = #{}
	
	method tieneConflictosCon()=conflictos
	method registrarConficto(pais) {
		conflictos.add(pais)
		pais.tieneConflictosCon().add(self)
	}
}

