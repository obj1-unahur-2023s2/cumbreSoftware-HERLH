import participantes.*

object cumbre {
	const personasParticipantes = []
	const paisesAuspiciantes = #{}
	var reqCommits = 300
	
	method ingresarPaisAuspiciante(pais){
		paisesAuspiciantes.add(pais)
	}
	method ingresarParticipante(persona){
		personasParticipantes.add(persona)
	}
	method paisesDeLosParticipantes() = personasParticipantes.map({p=>p.pais()})
	method paisesParticipantes() = self.paisesDeLosParticipantes().asSet()
	method paisesAuspiciantes() = paisesAuspiciantes
	
	method esConflictivo(pais) = pais.tieneConflictosCon().difference(paisesAuspiciantes).isEmpty()
	
	method cantDeParticipantesDePais(pais) = personasParticipantes.count({p=>p.pais()==pais})
	method paisConMasParticipantes() = self.paisesDeLosParticipantes().max({p=> self.cantDeParticipantesDePais(p)})
	method paisesExtranjeros() = self.paisesDeLosParticipantes().asSet().difference(paisesAuspiciantes)
	method esRelevante() = personasParticipantes.all({p=>p.esCape()})

	method reqCommits() = reqCommits
	method noAdmiteMasExtranjeros(pais) = self.cantDeParticipantesDePais(pais) >= 2
	method restringeElAcceso(participante) = self.esConflictivo(participante.pais()) or self.noAdmiteMasExtranjeros(participante.pais()) 
}
