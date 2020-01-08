# Clase que representa a una persona
# @author Luciana Varela Díaz <alu0101106175@ull.edu.es>
class Persona
	
	attr_reader :genero, :dieta, :maxproteinas
	
	# Método que crea una instancia de la clase Persona
	# @param genero Género de la persona
	# @param dieta Dieta que tiene esa persona
	# @return [Persona] Devuelve un objeto de la clase Persona
	def initialize(genero,dieta)

		@genero = genero
		@dieta = dieta
		
		if @genero == "masculino"
			@maxproteinas = 54
		else
			@maxproteinas = 41
		end
	end

	# Método para calcular el impacto que tiene la dieta de la persona
	# @return [Number] Devuelve el impacto que tienen los alimentos que consume esa persona
	def calcular_impacto_dieta

		if dieta.instance_of? Lista
			
			nodo = @dieta.head
			alimentoFinal = nodo.value
			while nodo != nil
				if alimentoFinal.nombre != nodo.value.nombre
					alimentoFinal = alimentoFinal + nodo.value
				end
				nodo = nodo.next
			end
			
			return alimentoFinal.impacto_ambiental  
		else

		alimentoFinal = @dieta[0]
		
		for alimento in @dieta
				if alimentoFinal.nombre != alimento.nombre	
					costeprobable = alimentoFinal.proteinas + alimento.proteinas
					if costeprobable <= @maxproteinas
						alimentoFinal = alimentoFinal.+(alimento)
					end
				end
			end

		end
		return alimentoFinal.impacto_ambiental
	end
end


